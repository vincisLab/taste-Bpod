function SoftCodeHandler_Zaber_motor_new(Byte)

if Byte == 1
    moveZ(133000,1)
elseif Byte == 2
    moveZ(1001,1)
elseif Byte == 3
    moveZ(133000,2)
elseif Byte == 4
    moveZ(3000,2)
elseif Byte == 5    % resets
    moveZ(5000,1)
    moveZ(5000,2)
end


% *********** designed ONLY to work with Specific Temperature protocol