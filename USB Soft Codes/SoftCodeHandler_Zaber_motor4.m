function SoftCodeHandler_Zaber_motor4(Byte)

cd('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\ZaberTask');
S = load('setting.mat');


if Byte == 1
    moveZ(S.distance.f,1)
elseif Byte == 2
    moveZ(S.distance.b,1)
elseif Byte == 3
    moveZ(S.distance.fAsp,2)
elseif Byte == 4
    moveZ(S.distance.bAsp,2)
elseif Byte == 5    % resets
    moveZ(2000,1)
    moveZ(2000,2)
end


% *********** designed ONLY to work with   Specific Temperature 2    *****