function flow = get_flowrate(sObj,MFCnum)
    %o = serial('COM5','BaudRate',115200,'Timeout',1,'Terminator','CR/LF');
    %fopen(o);
    
    %cmd = 'DMFC 1 2 A';
    %cmd_get = 'DMFC 1 2';
    cmd = sprintf('DMFC 1 %d A', MFCnum);
    cmd_get = sprintf('DMFC 1 %d', MFCnum);
    send_command(sObj, cmd_get);%first, flush the buffer on the teensy
    confirmation = send_command(sObj, cmd);
    while(isempty(confirmation) || ~startsWith(confirmation, 'MFC set'))
        confirmation = send_command(sObj, cmd);
    end
    returnStr = send_command(sObj, cmd_get);
    resultArr = split(returnStr, ' '); %this will give a 11x1 cell
    flow = str2double(resultArr{5});%5th column is the mass flow
   %fclose(o);
   % delete(o);
   % clear o
end