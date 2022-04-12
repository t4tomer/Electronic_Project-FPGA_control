
%% Reading _ ADC_data 



limit=155; %% limit from the FPGA

% Instrument Connection
% Find a serial port object.
obj1 = instrfind('Type', 'serial', 'Port', 'COM3', 'Tag', '');

% Create the serial port object if it does not exist
% otherwise use the object that was found.
if isempty(obj1)
    obj1 = serial('COM3');
else
    fclose(obj1);
    obj1 = obj1(1);
end

% Configure instrument object, obj1.
set(obj1, 'Terminator', {'','LF'});
set(obj1, 'Timeout', 1000.0);
set(obj1, 'Terminator', {'','LF'});
set(obj1, 'Terminator', {'','LF'});
set(obj1, 'BaudRate', 9600);


% Instrument Connection

% Connect to instrument object, obj1.
fopen(obj1);

% Instrument Configuration and Control
% for i=0:1:2
% Communicating with instrument object, obj1.
number_of_samples=10;
number_of_loops=204;

counter=number_of_samples;
 real_data_ADC=zeros(number_of_samples*number_of_loops,1);
start=1;

tic
k=1;
 for i=1:1:number_of_loops;

 data1 = fread(obj1, number_of_samples, 'uint8');
%  disp(num2str(i));
 real_data_ADC(start:counter)=data1;
 start=i*(number_of_samples)+1;
 counter=start+number_of_samples-1;

 end 
 

  toc;
  figure(1);
  title('dec level ADC data');
  plot(real_data_ADC,'-- o');%% this the real data from ADC
  hold on;
   plot(1:length(real_data_ADC),ones(1,length(real_data_ADC))*(limit),'black --') %% upper histersis limit 
  hold on;
  legend('decimal display');xlabel('samples');ylabel('decimal display');grid on ;grid minor;
  
  yticks([0:2:255]); set(gca,'FontSize',10); %% cosmetic of the plot 
  
%   
%   figure(2);
%   plot((real_data-0.7248)/83.9768,'-- d') %% I_shunt, dec_level=83.9768* I_shunt +0.7248
%   hold on;
%   plot(1:length(real_data),ones(1,length(real_data))*5,'black --') %% upper histersis limit 
%   hold on;
%    plot(1:length(real_data),ones(1,length(real_data))*4,'black --') %% lower histersis limit 
  
  
  
%   xlabel ('samples'),ylabel('I_{shunt}  [A]');grid on;  title('I_{shunt} ');
  
  




%% Reading _ IN_driver(not)_data 




% Instrument Connection
% Find a serial port object.
obj1 = instrfind('Type', 'serial', 'Port', 'COM3', 'Tag', '');

% Create the serial port object if it does not exist
% otherwise use the object that was found.
if isempty(obj1)
    obj1 = serial('COM3');
else
    fclose(obj1);
    obj1 = obj1(1);
end

% Configure instrument object, obj1.
set(obj1, 'Terminator', {'','LF'});
set(obj1, 'Timeout', 1000.0);
set(obj1, 'Terminator', {'','LF'});
set(obj1, 'Terminator', {'','LF'});
set(obj1, 'BaudRate', 9600);


% Instrument Connection

% Connect to instrument object, obj1.
fopen(obj1);

% Instrument Configuration and Control
% for i=0:1:2
% Communicating with instrument object, obj1.
number_of_samples=10;
number_of_loops=204;

counter=number_of_samples;
 real_data_IN_driver=zeros(number_of_samples*number_of_loops,1);
start=1;

tic
k=1;
 for i=1:1:number_of_loops;

 data1 = fread(obj1, number_of_samples, 'uint8');
%  disp(num2str(i));
 real_data_IN_driver(start:counter)=data1;
 start=i*(number_of_samples)+1;
 counter=start+number_of_samples-1;

 end 
 
%%
  toc;
  figure(2);
  title('dec level ADC data');
  plot(real_data_IN_driver,'-- o');%% this the real data from IN driver 
  hold on;
  plot(1:length(real_data_IN_driver),ones(1,length(real_data_IN_driver))*(limit),'black --') %% limit of the boundery control  
  hold on;
   plot(real_data_ADC,'-- o');%% this the real data from ADC
  legend('IN driver data(switch)','boundery limit ','ADC data');xlabel('samples');ylabel('decimal display');grid on ;grid minor;

  yticks([0:2:255]); set(gca,'FontSize',10); %% cosmetic of the plot 









