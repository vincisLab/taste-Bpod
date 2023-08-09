function SoftCodeHandler_Zaber_motor_new2(Byte)

% tar = target movement (where the motor should end)
% por = which USB port we need to activate (we have currently COM4 and COM9)
% dev = which device we need to move(we have currently two motors (1 and 3) daisy chained on COM9)

global S
if Byte == 1
   % tar = S.setting.motor.central.spout1_posF;
    por = 'COM9';
    dev = 1;
    moveZ(85000,dev,por);
elseif Byte == 2
   % tar = S.setting.motor.central.spout1_posB;
    por = 'COM9';
    dev = 1;
    moveZ(50000,dev,por);
elseif Byte == 3
    tar = S.posC_Forw;
    por = 'COM9';
    dev = 1;
    moveZ(tar,dev,por);
elseif Byte == 4
    tar = S.posC_Back;
    por = 'COM9';
    dev = 1;
    moveZ(tar,dev,por);
elseif Byte == 5     % lateral motor moving towards the selected spout
    tar = S.posL;
    por = 'COM9';
    dev = 3;
    moveZ(tar,dev,por);
elseif Byte == 6
    tar = S.posA_Up;
    por = 'COM4';
    dev = 1;
    moveZ(tar,dev,por);
elseif Byte == 7
    tar = S.posA_Down;
    por = 'COM4';
    dev = 1;
    moveZ(tar,dev,por);
% add more options as we add the lateral spout and aspiration
end


% *********** designed ONLY to work with Specific Temperature protocol