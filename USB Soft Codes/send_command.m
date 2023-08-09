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