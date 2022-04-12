function [dec_level] = UART_protocl_Send_Data_BC(I_desired)
%% Instrument Connection
% Find a serial port object.
%   -----used to send Boundery Control to altera 
%  dec_level=floor(83.9768*I_desired+0.7248); %% Pipelined Mode Timing (WR = RD) (MODE = 1)
  dec_level=floor(86.1584*I_desired+0.2863) %% RD Mode Timing (MODE = 0)
obj1 = instrfind('Type', 'serial', 'Port', 'COM5', 'Tag', '');
% if(0<=I_desired && I_desired<=1)
%     c=10;
% elseif ( I_desired<=1 && I_desired <=2 )
%     c=20;
% else ( I_desired<=2 && I_desired <=2.9)
%      c=30;
% end  ;   
%  c=7.3344;
%  dec_level=floor(66.7695*I_desired+c) ;%% pipeline mode 833Khz=f_RD(not)


% Create the serial port object if it does not exist
% otherwise use the object that was found.
if isempty(obj1)
    obj1 = serial('COM5');
else
    fclose(obj1);
    obj1 = obj1(1);
end
% Connect to instrument object, obj1.
fopen(obj1);
%%% Instrument Configuration and Control\
% dec_number=5/256
% Communicating with instrument object, obj1.
fwrite(obj1,dec_level , 'uint8');
end
