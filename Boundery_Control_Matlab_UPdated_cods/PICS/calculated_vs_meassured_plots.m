clc;clear all;close all;
k=1;
R_shunt=15*(1e-3); %% 15m[Ohm]
Gain=50;
V_ref=2.3;
k=1;i=0;
for i=1:14   
    
    
   I_shunt=[0.109;0.195;0.332;0.609;0.759;0.962;1.1;1.357;1.465;1.702;1.755;2.284;2.503;2.769]
   V_shunt_after_GAIN(i)=I_shunt(i)*Gain*R_shunt; %% voltage across shunt after GAIN calculated
   
   limit_calculated(i)= round(V_shunt_after_GAIN(i)/(V_ref/256)); %% calculated dec limit 
%    limit_measured(i)=input('enter limit from the 7segment display:'); %% measured dec limit 
   limit_measured=[1;8;28;47;63;79;95;111;127;143;158;205;223;239]
      
   V_gain_50_calculated(i)=V_shunt_after_GAIN(i);%% voltage across shunt after GAIN calculated 
%    V_gain_50__meassured(i)= input('enter voltage on scope:'); %% voltage across shunt after GAIN on scope
    V_gain_50__meassured=[70*1e-3;150*1e-3;270*1e-3;500*1e-3;0.62;0.79;0.81;1.1;1.2;1.4;1.43;1.94;2.2;2.35]

   disp('next calculation!');
   
   if (I_shunt(i)==9999)
       k=2
   else 
       k=1
   end 
   
   
   
   
end



figure(1);
plot(I_shunt,limit_calculated,'red -- diamond'); %% plot of calculated dec number 
hold on; 
plot(I_shunt,limit_measured,'blue -- square '); %% plot of measured dec number 
legend('calculated','measured');grid on;
title('measured vs calcualted GAIN=50,V_{ref}=2.3');
xlabel('I[A]');ylabel('Dec number');grid on;

figure(2);
plot(I_shunt,100-(limit_calculated*100)./limit_measured)
title(' deviation between dec limit calculated and dec limit measured');
xlabel('I[A]');ylabel('deviation dec limit [%]');


figure(3)
plot(I_shunt,V_gain_50_calculated,'-- red square');
hold on;
plot(I_shunt,V_gain_50__meassured,'-- green diamond');
xlabel('I shunt[A]');ylabel(' V_{shunt} after GAIN[V]');
title('calculated vs meassured (GAIN =50) of V_{shunt} ');
legend(' calculated' , 'messured')
grid on ;


 figure(4);
 plot(I_shunt,100-(V_gain_50_calculated*100)./V_gain_50__meassured)
 title('deviation between V_{shunt} meassured and calculated') 
xlabel('I[A]');ylabel('deviation V_{shunt} [%]');


%% test the INA225 
k=1;
R_shunt=15*(1e-3); %% 15m[Ohm]
Gain=50;
V_ref=2.3;

for i=1:20
    
   I_shunt(i)=input('enter I shunt:');
   V_gain_50_calculated(i)=I_shunt(i)*Gain*R_shunt;
   V_gain_50__meassured(i)= input('enter voltage on scope:');
   disp('next calcultion');
   
   
end

figure(2)
stem(I_shunt,V_gain_50_calculated,'red square');
hold on;
stem(I_shunt,V_gain_50__meassured,'green diamond');
xlabel('I shunt[A]');ylabel(' V_{shunt} after GAIN[V]');
title('calculated vs meassured (GAIN =50) of Vshunt ');
legend(' calculated' , 'messured')
grid on ;

% 
 figure(3);
 stem(I_shunt,100-(V_gain_50_calculated*100)./V_gain_50__meassured)
 figure(4)
 stem(I_shunt,100-(limit_calculated*100)./limit_measured)





