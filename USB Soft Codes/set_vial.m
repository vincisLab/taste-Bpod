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