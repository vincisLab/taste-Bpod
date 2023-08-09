%% SET MFC FLOWRATE FUNCTION
function success = set_flowrate(sObj, MFCnum, flow, capacity)
    cmd = sprintf('DMFC 1 %d A%d', MFCnum, floor(64000*flow/capacity));
    confirmation = send_command(sObj, cmd);
    if(startsWith(confirmation, 'MFC set'))
        success = 1;
    else
        success = 0;
        display(sprintf('Set MFC%d failed!', MFCnum));
    end   
end