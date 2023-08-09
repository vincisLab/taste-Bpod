function CleaningOlfactometer(time_to_repeat)
%OLFACTOMETER FUNCTIONS AND BASIC CODE

%Initial connection with serial port. COM port will depend on computer. 
s = serial('COM5','BaudRate',115200,'Timeout',1,'Terminator','CR/LF');
fopen(s);


%Set MFC example
 %set_flowrate(s, MFCnumber, desiredflow, capacity)
 set_flowrate(s, 1, 0, 1000);
 set_flowrate(s, 2, 0, 200);
% 
% pause(5);
% 
% %Poll MFC example
% %get_flowrate(s,MFCnumber)
% flow1 = get_flowrate(s, 1);
% flow2 = get_flowrate(s, 2);

%Open Vial 5 example
%set_vial(s, desired vial#, open=1 close=0)
for t = 1:time_to_repeat
    for ii = 5:11
        set_vial(s, ii, 1);
        pause(4);
        set_vial(s, ii, 0);
        pause(0.25)
    end
    if t == 100
        print('Done!!')
    else
    end
end
%Disconnect serial port
fclose(s);
end
%If program crashes without closing serial port, the COM port will be
%unavailable. Use instrfind('Type', 'serial') to find open port. ss = out1(#
%of open port), fclose(ss), clear. 

% %% SET MFC FLOWRATE FUNCTION
% function success = set_flowrate(sObj, MFCnum, flow, capacity)
%     cmd = sprintf('DMFC 1 %d A%d', MFCnum, floor(64000*flow/capacity));
%     confirmation = send_command(sObj, cmd);
%     if(startsWith(confirmation, 'MFC set'))
%         success = 1;
%     else
%         success = 0;
%         display(sprintf('Set MFC%d failed!', MFCnum));
%     end   
% end

%% POLL MFC FLOWRATE FUNCTION
% function flow = get_flowrate(sObj, MFCnum)
%     %cmd = 'DMFC 1 2 A';
%     %cmd_get = 'DMFC 1 2';
%     cmd = sprintf('DMFC 1 %d A', MFCnum);
%     cmd_get = sprintf('DMFC 1 %d', MFCnum);
%     send_command(sObj, cmd_get);%first, flush the buffer on the teensy
%     confirmation = send_command(sObj, cmd);
%     while(isempty(confirmation) || ~startsWith(confirmation, 'MFC set'))
%         confirmation = send_command(sObj, cmd);
%     end
%     returnStr = send_command(sObj, cmd_get);
%     resultArr = split(returnStr, ' '); %this will give a 11x1 cell
%     flow = str2double(resultArr{5});%5th column is the mass flow
% end

%% TURN ON AND OFF VIALS FUNCTION
function success = set_vial(sObj, vialnum, state)
    if(state > 0)
        cmd = sprintf('vialOn 1 %d', vialnum);
    else
        cmd = sprintf('vialOff 1 %d', vialnum);
    end
    
    tline = send_command(sObj, cmd);
    resultArr = split(tline, ' ');
    if(strcmp(resultArr{1}, 'Error'))
        display(tline);
        success = 0;
    else
        success = 1;
    end
end

%% SEND COMMAND TO TEENSY (only will work with matlab2018b)
function tline = send_command(sObj, cmd)
    flushinput(sObj);
    for i = 1:10
        fprintf(sObj, cmd);
        tline = fgets(sObj);
        tline = fgets(sObj);
        if (sObj.BytesAvailable > 0)
            flushinput(sObj);
        end
        if(~isempty(tline))
            break;
        end
    end
end

