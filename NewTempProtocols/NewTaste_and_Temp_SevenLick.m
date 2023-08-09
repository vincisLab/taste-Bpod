 function NewTaste_and_Temp_SevenLick

%%
% Functions to run simple active taste delivery (no decision involved).
% Created by Roberto Vincis @ Department of Biological
% Science, vincisLab, FSU.
% This function is meant to be called from the Bpod console (Copyright (C) 2017 Sanworks LLC, Stony Brook, New York, USA)
% Modified by Roberto Vincis and Justin Brown @ Department of Biological
% Science, vincisLab, FSU. November 2018
%%

global BpodSystem
global S

%--- Define parameters and trial structure
S = BpodSystem.ProtocolSettings; % Loads settings file chosen in launch manager into current workspace as a struct called 'S'
if isempty(fieldnames(S))  % If chosen settings file was an empty struct, populate struct with default settings
    % Define default settings here as fields of S (i.e S.InitialDelay = 3.2)
    % Note: Any parameters in S.GUI will be shown in UI edit boxes. 
    
    cd('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\ZaberTemp');
    S = load('setting.mat');
    cd('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\NewTempProtocols');
    S.W                   = BpodWavePlayer('COM11');  % Bpod analog in module is connected to COM4
    %S.W.TriggerProfileEnable = 'Off';
end

%--- Initialize the softcode handler to control Zaber within the statemachine
BpodSystem.SoftCodeHandlerFunction = 'SoftCodeHandler_Zaber_motor_new';   % We add the soft code to move the zaber

%--- Initialize the control for generation of sounds
Sound  = GenerateSineWave(30000, 55000, S.setting.soundduration);
%Sound1 = GenerateSineWave(S.GUI.SamplingRate + 30000, S.GUI.Frequency, S.setting.soundduration);

Sound  = Sound(1:10000*S.setting.soundduration);

S.W.TriggerProfileEnable='On';

S.W.loadWaveform(1, Sound);
S.W.TriggerProfiles(1,[1 2])=1;
LoadSerialMessages('WavePlayer1', {['P' 0], ['P' 1]}); % check for the  
%% Licking shit
    S.A                   = BpodAnalogIn('COM3');   % Bpod analog in module is connected to COM10
    S.A.SamplingRate      = 1000                   ;                  % We sample 9999 point per second
    S.A.InputRange{1}     = '0V:10V'               ;              % The analog signal recorded ranges from -5V to 5V
    S.A.Thresholds(1)     = 7                  ;                    % Threshold for lick detection
    S.A.ResetVoltages(1)  = 1                   ;                  % Reset for lick detection
    S.A.SMeventsEnabled(1)= 1                      ;                     % Indicates (1=yes) whether eac
%% Generate random permutation for the taste delivery
% let's say we have 5 tastants to test (the number of tastant should be an input defined earlier as S.lotas)
tasteid = S.setting.listoftaste;  % vector containing the taste line id to use 
if length(S.setting.listoftaste)<2
    TrSeq(1,1:S.setting.trialnumber) = S.setting.listoftaste;
else
    for t=1:S.setting.trialnumber
        [~,~,Temp] = uniqperms(tasteid);  % use the function uniqperm to generate unique permutation depending on the taste
        if t == 1
            Perms = Temp;
        else
            Perms = [Perms;Temp];
        end
    end
    TrSeq = reshape(Perms',1,size(tasteid,2)*size(Perms,1));  
end
      %arranges the matrix into a single array of permutations

%% Generate random intertrial intervals (ITI) distribution
a = S.setting.ITIrange(1,1);
b = S.setting.ITIrange(1,2);
S.setting.vectorITI  = (b-a).*rand(1000,1) + a;
S.setting.vectorITI  = S.setting.vectorITI';
%
if S.setting.soundduration > 0.25
    SoundDelay = 0.25;
else
    SoundDelay = S.setting.soundduration - (S.setting.soundduration*0.5);  %Delay length is 50% of the duration
end

%% Initialize plot
% Taste Outcome Plot 1
BpodSystem.ProtocolFigures.TasteOutcomePlotFig = figure('Position', [10 830 2000 320],'name','Taste sequence plot','numbertitle','off', 'MenuBar', 'none', 'Resize', 'on', 'Color', [0.05 0.7 0.9]);
BpodSystem.GUIHandles.TasteOutcomePlot = axes('Position', [.075 .35 .89 .55], 'Color',[0.9 0.8 0.8]);
TasteOutcomePlot(BpodSystem.GUIHandles.TasteOutcomePlot,'init',TrSeq,S.setting.stimID);

% Raster Lick plot
BpodSystem.ProtocolFigures.rasterLickPlot = figure('Position', [900 100 1000 700],'name','Raster plot','numbertitle','off', 'MenuBar', 'none', 'Resize', 'off');
BpodSystem.GUIHandles.rasterLickPlot = axes('Position', [.06 .1 .9 .85]);
rasterLickPlot(BpodSystem.GUIHandles.rasterLickPlot, 'init', S.setting.trialnumber)

%moveZ(1001,1,'COM9'); % do we need the home position here? I dont know
%moveZ(1001,3,'COM9');
%moveZ(1001,1,'COM4');
%% Main loop (runs once per trial)
for T = 1:S.setting.trialnumber
     %--- Computing variables for assembling this trial's state machine                                 % Sync parameters with BpodParameterGUI plugin
     S.A.startReportingEvents()                                            ;                            % starts sending bytes to sma to report threshold crossing events
     S.A.startLogging()                                                    ;                            % starts logging samplannels
     currentTrial(1,1) = TrSeq(T)                                          ;
     currentTrial(1,2) = T                                                 ;
     S.posA_Up   = S.setting.motor.asp.up;
     S.posA_Down = S.setting.motor.asp.down;
     S.posC_Forw = S.setting.motor.central.for;
     S.posC_Back = S.setting.motor.central.bac;
    %--- Assemble state machine
    switch currentTrial(1,1)
        case 1
            LoadSerialMessages('ValveModule1', {['O' 1], ['C' 1],['O' S.setting.rinseline ], ['C' S.setting.rinseline ]});  % Set serial messages 1 and 2
            time = S.setting.duration.v1;

        case 2
            LoadSerialMessages('ValveModule1', {['O' 2], ['C' 2],['O' S.setting.rinseline ], ['C' S.setting.rinseline ]});  % Set serial messages 1 and 2
            time = S.setting.duration.v2;
        case 3
            LoadSerialMessages('ValveModule1', {['O' 3], ['C' 3],['O' S.setting.rinseline ], ['C' S.setting.rinseline ]});  % Set serial messages 1 and 2
            time = S.setting.duration.v3;
        case 4
            LoadSerialMessages('ValveModule1', {['O' 4], ['C' 4],['O' S.setting.rinseline ], ['C' S.setting.rinseline ]});  % Set serial messages 1 and 2
            time = S.setting.duration.v4;
        case 5
            LoadSerialMessages('ValveModule1', {['O' 5], ['C' 5],['O' S.setting.rinseline ], ['C' S.setting.rinseline ]});  % Set serial messages 1 and 2
            time = S.setting.duration.v5;
        case 6
            LoadSerialMessages('ValveModule1', {['O' 6], ['C' 6],['O' S.rinseline ], ['C' S.rinseline ]});  % Set serial messages 1 and 2
            time = S.setting.duration.v6;
    end

sma = NewStateMachine();
sma = SetGlobalCounter(sma, 1, 'AnalogIn1_1', S.setting.noflick); % Arguments: (sma, CounterNumber, TargetEvent, Threshold)?
sma = SetGlobalCounter(sma, 2, 'AnalogIn1_1', 1); % for the rinse
%%   For each trial, the Zaber motor will move foward the specified distance and wait for licks from the mouse. 
%   If the mouse licks:
%       -the zaber moves back into starting position
%       -the state machine begins the rinse procedures (pre/post rinse)
%           -- moves out again to wait for licks
%           -- delivers water if the mouse licks, returns otherwise
%       -saves data for licks from tastant, rinse, or both
%   If the mouse DOESN'T lick:
%       -The state machine skips the rinse procedures, Zaber moves back
%       -saves data
%       -Moves to next trial
%
%   The state machine saves all of the data and plots the trials
%%

% 1st state - BNC1 - sending a TTL to plexon(to realigned Plexon data)
% 2nd state - move the lateral motor to put in position the correct spout
% 3rd state - move the aspiration motor up 
% 4th state - open the line for 1 sec to clear the dead volume of water at the wrong temp.
% 5th state - delay n sec to allow aspiration of all liquid in excess.
% 6th state - move the aspiration motor down
% 7th state - sound cue on
% 8th state - ZaberF1 - moving spout forward
% 9th state - WaitForLick1_IN - wait for lick in (behavioral port 2) 
%              if lick is detected we jump to 10th state
%              otherwise we jump to 17th 
% 10th state - WaitForLick1_OUT - wait for lick out (behavioral port 2) 
% 11th state - Open Valve 
% 12th state - send BNC to plexon (timestamp of stimulus delivery)
% 13th state - Delay Valve (time imposed by the Zbaer Temp and valve calibration)
% 14th state - Close Valve (time imposed by the Zbaer Temp and valve calibration)
% 15th state - Controlstate light on licking spout (to verify detection of licks)
% 16th state - Stimulus sampling 5 sec
% 17th state - ZaberFB1 - moving spout backward
% 18th state - ITI
 

sma = AddState(sma, 'Name', 'BNC1', ...           % send a time stamp to analog 2 Plexon or Aruduino for Photometry (use to realigned all the data  )
    'Timer', 0.001,...
    'StateChangeConditions', {'Tup', 'AspMotorUp'},...
    'OutputActions', {'BNCState', 1 }); % 

sma = AddState(sma, 'Name', 'AspMotorUp', ...     % move the aspiration motor to put in position 
    'Timer', 1,...
    'StateChangeConditions', {'Tup', 'CleanLine'},...
    'OutputActions', {'SoftCode',6 }); % 

sma = AddState(sma, 'Name', 'CleanLine', ...      % open the line such to clean the dead volume at the wrong temp
    'Timer', 0.001,...
    'StateChangeConditions', {'Tup', 'DelayCleaning'},...
    'OutputActions', {'ValveModule1',  1}); %

sma = AddState(sma, 'Name', 'DelayCleaning', ...
    'Timer', 0.1,...
    'StateChangeConditions', {'Tup', 'CloseLine'},...
    'OutputActions', {}); % Sends serial message 1

sma = AddState(sma, 'Name', 'CloseLine', ...      % open the line such to clean the dead volume at the wrong temp
    'Timer', 0,...
    'StateChangeConditions', {'Tup', 'Delay_1'},...
    'OutputActions', {'ValveModule1',  2}); %

sma = AddState(sma, 'Name', 'Delay_1', ...        % allow the vacuum to suck all the excess liquid
    'Timer', 2,...
    'StateChangeConditions', {'Tup', 'AspMotorDown'},...
    'OutputActions', { }); %

sma = AddState(sma, 'Name', 'AspMotorDown', ...   % move the aspiration motor down in position 
    'Timer', 0.01,...
    'StateChangeConditions', {'Tup', 'SoundOn'},...
    'OutputActions', {'SoftCode',7 }); % 

sma = AddState(sma, 'Name', 'SoundOn', ...
    'Timer', 0.01,...
    'StateChangeConditions', {'Tup', 'ZaberF1'},... 
    'OutputActions', {'WavePlayer1', 1}); % 

sma = AddState(sma, 'Name', 'ZaberF1', ...
    'Timer', 0.5,...
    'StateChangeConditions', {'Tup', 'WaitForLick1_IN'},...
    'OutputActions', {'SoftCode',1});
% 
sma = AddState(sma, 'Name', 'WaitForLick1_IN', ...
        'Timer', 4,...
        'StateChangeConditions', {'Tup' , 'ZaberB1', 'GlobalCounter1_End', 'OpenValve'},...    
        'OutputActions', {'GlobalCounterReset', 1}); 

sma = AddState(sma, 'Name', 'OpenValve', ...
    'Timer', 0.001,...
    'StateChangeConditions', {'Tup', 'BNC2Valv1'},...
    'OutputActions', {'ValveModule1',  1,'BNCState', 2 }); % Sends serial message 1, opening the valve.

sma = AddState(sma, 'Name', 'BNC2Valv1', ...   % send a time stamp to analog 3 Plexon for valve opening (use to realigned all the data)
    'Timer', 0.001,...
    'StateChangeConditions', {'Tup', 'DelayValve'},...
    'OutputActions', {}); % 

sma = AddState(sma, 'Name', 'DelayValve', ...
    'Timer', time/1000,...
    'StateChangeConditions', {'Tup', 'CloseValve'},...
    'OutputActions', {}); % Sends serial message 1

sma = AddState(sma, 'Name', 'CloseValve', ...
    'Timer', 0,...
    'StateChangeConditions', {'Tup', 'controlstate'},...
    'OutputActions', {'ValveModule1', 2}); % Sends serial message 2, closing the valve.

sma = AddState(sma, 'Name', 'controlstate', ...
        'Timer', 0.001,...
        'StateChangeConditions', {'Tup','TasteSampling'},...
        'OutputActions', {'PWM2', 0});
   
sma = AddState(sma, 'Name', 'TasteSampling', ...
    'Timer', 5,...
    'StateChangeConditions', {'Tup', 'ZaberB1'},...
    'OutputActions', {});

sma = AddState(sma, 'Name', 'ZaberB1', ...
    'Timer', 2,...
    'StateChangeConditions', {'Tup', 'ZaberF1_rinse'},...
    'OutputActions', {'SoftCode',2});
% 
sma = AddState(sma, 'Name', 'ZaberF1_rinse', ...
    'Timer', 0.8,...
    'StateChangeConditions', {'Tup', 'WaitForLick1_IN_rinse'},...
    'OutputActions', {'SoftCode', 1});
% 
sma = AddState(sma, 'Name', 'WaitForLick1_IN_rinse', ...
        'Timer', 2,...
        'StateChangeConditions', {'Tup' ,'ZaberB1_rinse','GlobalCounter2_End','OpenValveRinse'},...
        'OutputActions', {'GlobalCounterReset', 2});   % i know what can be the problem
    
sma = AddState(sma, 'Name', 'OpenValveRinse', ...
    'Timer', 0.001,...
    'StateChangeConditions', {'Tup', 'DelayValveRinse'},...
    'OutputActions', {'ValveModule1',  3}); % Sends serial message 1, opening the valve.

sma = AddState(sma, 'Name', 'DelayValveRinse', ...
    'Timer', time/1000,...
    'StateChangeConditions', {'Tup', 'CloseValveRinse'},...
    'OutputActions', {}); % Sends serial message 1

sma = AddState(sma, 'Name', 'CloseValveRinse', ...
    'Timer', 0,...
    'StateChangeConditions', {'Tup', 'controlstate2'},...
    'OutputActions', {'ValveModule1', 4}); % Sends serial message 2, closing the valve.
%    
sma = AddState(sma, 'Name', 'controlstate2', ...
        'Timer', 0.1,...
        'StateChangeConditions', {'Tup','rinsesampl'},...
        'OutputActions', {'PWM2', 0});

sma = AddState(sma, 'Name', 'rinsesampl', ...
        'Timer', 2,...
        'StateChangeConditions', {'Tup','ZaberB1_rinse'},...
        'OutputActions', {});
%    
sma = AddState(sma, 'Name', 'ZaberB1_rinse', ...
    'Timer', 0.8,...
    'StateChangeConditions', {'Tup', 'ITI'},...
    'OutputActions', {'SoftCode',2});

sma = AddState(sma, 'Name', 'ITI', ...
    'Timer',6,...
    'StateChangeConditions', {'Tup', '>exit'},...
    'OutputActions', {'AnalogIn1', 2}); % Sends serial message 2 (Stop logging)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

SendStateMachine(sma);
RawEvents = RunStateMachine;

      if ~isempty(fieldnames(RawEvents)) % If you didn't stop the session manually mid-trial
        BpodSystem.Data = AddTrialEvents(BpodSystem.Data,RawEvents); % Adds raw events to a human-readable data struct
        BpodSystem.Data.TrialSettings(1)             = S; % Adds the settings used for the current trial to the Data struct (to be saved after the trial ends)
%        BpodSystem.Data.RawEvents.Trial{1,T}.Analog  = S.A.getData;
        BpodSystem.Data.RawEvents.Trial{1,T}.TasteID = currentTrial(1,1);
%        flagPlotTaste  = any(~isnan(BpodSystem.Data.RawEvents.Trial{1,T}.States.OpenValve));
%         flagPlotTaste  = any(~isnan(BpodSystem.Data.RawEvents.Trial{1,T}.States.controlstate));
%        flagPlotRinse  = any(~isnan(BpodSystem.Data.RawEvents.Trial{1,T}.States.OpenValveRinse));
%         flagPlotRinse  = any(~isnan(BpodSystem.Data.RawEvents.Trial{1,T}.States.controlstate2));

%         TasteOutcomePlot(BpodSystem.GUIHandles.TasteOutcomePlot,'update',currentTrial,flagPlotTaste,flagPlotRinse);  
        if any(~isnan(BpodSystem.Data.RawEvents.Trial{1,T}.States.controlstate))== 0
            rasterLickPlot(BpodSystem.GUIHandles.rasterLickPlot, 'update',currentTrial(1,2), [],[]);
        else
            rasterLickPlot(BpodSystem.GUIHandles.rasterLickPlot, 'update',currentTrial(1,2), BpodSystem.Data.RawEvents.Trial{1, T}.Events.AnalogIn1_1, BpodSystem.Data.RawEvents.Trial{1, currentTrial(1,2)}.States.OpenValve(1,1))
        end
         
        SaveBpodSessionData; % Saves the field BpodSystem.Data to the current data file
        disp(['Saved data for trial #' num2str(T)]);
        %--- Typically a block of code here will update online plots using the newly updated BpodSystem.Data
       
      end
    
    %--- This final block of code is necessary for the Bpod console's pause and stop buttons to work
    HandlePauseCondition; % Checks to see if the protocol is paused. If so, waits until user resumes.
    if BpodSystem.Status.BeingUsed == 0
        return
    end
end
