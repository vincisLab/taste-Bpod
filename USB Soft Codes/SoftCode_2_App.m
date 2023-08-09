% Example state matrix: Sends a soft code byte to an external application
% connected to the state machine's app serial port.
% The name of the app serial port is at: BpodSystem.HW.AppSerialPortName
% Note: This feature is only available on FSM 2 or newer, and requires Firmware v23

sma = NewStateMatrix();

sma = AddState(sma, 'Name', 'SendSoftCode2APP', ...
    'Timer', 0,...
    'StateChangeConditions', {'Tup', '>exit'},...
    'OutputActions', {'APP_SoftCode', 1});