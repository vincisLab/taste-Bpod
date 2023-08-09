function SoftCodeHandler_Zaber_motor2(Byte)

if Byte == 1
    moveZ(1000*127,1)
elseif Byte == 2
    moveZ(1002*1,1)
elseif Byte == 3
    moveZ(1000*133,2)
elseif Byte == 4
    moveZ(1002*1,2)
end


