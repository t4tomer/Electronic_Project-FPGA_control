function [] = UART_protocl_Send_Data_PWM(number)
%% Instrument Connection
% Find a serial port object.
%    used to send the PWM limit for PWM of 200kHz
 number=round((number/100)*250)
obj1 = instrfind('Type', 'serial', 'Port', 'COM5', 'Tag', '');
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
fwrite(obj1,number , 'uint8');
end

