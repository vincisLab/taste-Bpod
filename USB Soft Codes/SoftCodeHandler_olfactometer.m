function SoftCodeHandler_olfactometer(Byte)

% tar = target movement (where the motor should end)
% por = which USB port we need to activate (we have currently COM4 and COM9)
% dev = which device we need to move(we have currently two motors (1 and 3) daisy chained on COM9)

%global S
if (Byte == 5) || (Byte==6) || (Byte==7) || (Byte==8) || (Byte==9) || (Byte==10) || (Byte==11)
    olfacto_open(Byte)
elseif (Byte == 25) || (Byte==26) || (Byte==27) || (Byte==28) || (Byte==29) || (Byte==30) || (Byte==31)
    NByte = Byte-20;
    olfacto_close(NByte)
elseif Byte == 255
    %S.MFC(1,1) = get_flowrate_softCode(1);
    %S.MFC(1,2) = get_flowrate_softCode(2);
end



    