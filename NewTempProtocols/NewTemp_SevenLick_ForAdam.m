 function NewTemp_SevenLick_ForAdam

%%
% Functions to run simple odor and taste delivery (no decision involved).
% Created by Roberto Vincis and Adam Dewan @ Department of Biological
% Science and Psychology, at FSU.
% This function is meant to be called from the Bpod console (Copyright (C) 2017 Sanworks LLC, Stony Brook, New York, USA)
%%
MFC_1 = 400;
MFC_2 = 100;

o = serial('COM5','BaudRate',115200,'Timeout',1,'Terminator','CR/LF');
fopen(o);

% 1 - set the flow rate
set_flowrate(o, 1, MFC_1, 1000);
set_flowrate(o, 2, MFC_2, 200);
pause(1.5)
% 2 - set the flow rate
temp_flow_1 = get_flowrate(o,1);
temp_flow_2 = get_flowrate(o,2);

if (temp_flow_1>10) && (temp_flow_2>10)
    for vial = 5:11
        set_vial(o,vial,1)
        pause(1)
        set_vial(o,vial,0)
        pause(2)
    end
else
    fclose(o);
    delete(o);
    clear o;
    error('THE AIR TANK IS LIKELY TO BE OFF !!!!!!!!!!!!');
end

fclose(o);
delete(o);
clear o

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

%--- Initialize the softcode handler to control the Dewan's lab Olfactometer within the statemachine
BpodSystem.SoftCodeHandlerFunction = 'SoftCodeHandler_olfactometer';   % We add the soft code to move the zaber

%% --- Initialize the control for generation of sounds
Sound  = GenerateSineWave(30000, 55000, S.setting.soundduration);
Sound  = Sound(1:10000*S.setting.soundduration);
S.W.TriggerProfileEnable='On';
S.W.loadWaveform(1, Sound);
S.W.TriggerProfiles(1,[1 2])=1;
LoadSerialMessages('WavePlayer1', {['P' 0], ['P' 1]}); % check for the  
%% Licking: as of now we are not recording licking activity but I leave this snippet in here for future reference
    S.A                   = BpodAnalogIn('COM3');   % Bpod analog in module is connected to COM10
    S.A.SamplingRate      = 1000                   ;                  % We sample 9999 point per second
    S.A.InputRange{1}     = '0V:10V'               ;              % The analog signal recorded ranges from -5V to 5V
    S.A.Thresholds(1)     = 7                      ;                    % Threshold for lick detection
    S.A.ResetVoltages(1)  = 5                      ;                  % Reset for lick detection
    S.A.SMeventsEnabled(1)= 1                      ;                     % Indicates (1=yes) whether eac
    S.A.InputRange{3}     = '-10V:10V'             ;              % The analog signal recorded ranges from -5V to 5V
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
clear Temp Perm
%% Generate permutations for odor vials
vial_list = [5,6,7,8,9,10,11];
for t=1:S.setting.trialnumber
    [~,~,Temp] = uniqperms(vial_list);  % use the function uniqperm to generate unique permutation depending on the taste
    if t == 1
        Perms = Temp;
    else
        Perms = [Perms;Temp];
    end
end
VialSequence = reshape(Perms',1,size(vial_list,2)*size(Perms,1));  
VialSequence = VialSequence(1:S.setting.trialnumber);
%% Generate random intertrial intervals (ITI) distribution . 
% a = S.setting.ITIrange(1,1);
% b = S.setting.ITIrange(1,2);
% S.setting.vectorITI  = (b-a).*rand(1000,1) + a;
% S.setting.vectorITI  = S.setting.vectorITI';
% %
% if S.setting.soundduration > 0.25
%     SoundDelay = 0.25;
% else
%     SoundDelay = S.setting.soundduration - (S.setting.soundduration*0.5);  %Delay length is 50% of the duration
% end

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
     %--- Computing variables for assembling this trial's state machine
%     S.setting.NofTrialTot                = T                                  ;
%     S.setting.CurrentTr                  = S.setting.stimID(TrSeq(T)).valve           ;
%     S.GUI.currentITI_sec             = S.GUI.vectorITI(T)                 ;  
%     S = BpodParameterGUI('sync', S)                                       ;                            % Sync parameters with BpodParameterGUI plugin
     S.A.startReportingEvents()                                            ;                            % starts sending bytes to sma to report threshold crossing events
     S.A.startLogging()                                                    ;                            % starts logging samplannels
     currentTrial(1,1) = TrSeq(T)                                          ;
     currentTrial(1,2) = T                                                 ;
     currentTrial(1,3) = VialSequence(T)                                   ;
     currentTrial(1,4) = VialSequence(T)+20                                  ;

    %--- Assemble state machine
    switch currentTrial(1,1)
        case 6  % spout in the rig: number 2
            LoadSerialMessages('ValveModule1', {['O' 6], ['C' 6],['O' S.setting.rinseline ], ['C' S.setting.rinseline ]});  % Set serial messages 1 and 2
            time = S.setting.duration.v6;
            S.posC_Forw = S.setting.motor.central.spout2_posF;
            S.posC_Back = S.setting.motor.central.spout2_posB;
            S.posL      = S.setting.motor.lateral.spout2_pos;
            S.posA_Up   = S.setting.motor.asp.spout2_pos;
            S.posA_Down = S.setting.motor.asp.down;

        case 7  % spout in the rig: number 3
            LoadSerialMessages('ValveModule1', {['O' 7], ['C' 7],['O' S.setting.rinseline ], ['C' S.setting.rinseline ]});  % Set serial messages 1 and 2
            time = S.setting.duration.v7;
            S.posC_Forw = S.setting.motor.central.spout3_posF;
            S.posC_Back = S.setting.motor.central.spout3_posB;
            S.posL      = S.setting.motor.lateral.spout3_pos;
            S.posA_Up   = S.setting.motor.asp.spout3_pos;
            S.posA_Down = S.setting.motor.asp.down;
            
        case 8 % 
            LoadSerialMessages('ValveModule1', {['O' 8], ['C' 8],['O' S.setting.rinseline ], ['C' S.setting.rinseline ]});  % Set serial messages 1 and 2
            time = S.setting.duration.v8;
            S.posC_Forw = S.setting.motor.central.spout4_posF;
            %S.posC_Forw = S.setting.motor.central.for;
            S.posC_Back = S.setting.motor.central.spout4_posB; 
            %S.posC_Back = S.setting.motor.central.bac;
            S.posL      = S.setting.motor.lateral.spout4_pos;
            S.posA_Up   = S.setting.motor.asp.spout4_pos;
            S.posA_Down = S.setting.motor.asp.down;
%         case 4
%             LoadSerialMessages('ValveModule1', {['O' 4], ['C' 4],['O' S.setting.rinseline ], ['C' S.setting.rinseline ]});  % Set serial messages 1 and 2
%             time = S.setting.duration.v4;
%             %timeRinse= S.duration.rinseline;
%             %S.GUI.NofTrialValve4  = S.GUI.NofTrialValve4+1;
%         case 5
%             LoadSerialMessages('ValveModule1', {['O' 5], ['C' 5],['O' S.setting.rinseline ], ['C' S.setting.rinseline ]});  % Set serial messages 1 and 2
%             time = S.setting.duration.v5;
%             %timeRinse= S.duration.rinseline;
%             %S.GUI.NofTrialValve5  = S.GUI.NofTrialValve5+1;
%         case 6
%             LoadSerialMessages('ValveModule1', {['O' 6], ['C' 6],['O' S.rinseline ], ['C' S.rinseline ]});  % Set serial messages 1 and 2
%             time = S.setting.duration.v6;
%             %timeRinse= S.duration.rinseline;
%             %S.GUI.NofTrialValve6  = S.GUI.NofTrialValve6+1;
    end

sma = NewStateMachine();
sma = SetGlobalCounter(sma, 1, 'AnalogIn1_1', 8); % Arguments: (sma, CounterNumber, TargetEvent, Threshold)?
%sma = SetGlobalCounter(sma, 2, 'AnalogIn1_1', 1); % A
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
% 2nd state - Softcode olfacto open
% 3rd state - delay to establish 0.6s ish
% 4th state - trigger Adam's magic box (BNCState 2) - we need to plug in
%             dig 2 in the back of Adam's Box; Output to Plexon is dig 7
% 5th state - delay 2.5s
% 6th state - Softcode olfacto close
% 7th state - delay 4.5s
% 8th state - Water valve open
% 9th state - delay valve 0.03ish
% 10th state - Water valve close
% 11th state - Softcode olfacto byte 255 - MFC
% 12th state - ITI

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
sma = AddState(sma, 'Name', 'Start', ...           % send a time stamp to analog 2 Plexon or Aruduino 
    'Timer', 0.1,...
    'StateChangeConditions', {'Tup', 'Olfacto_ON'},...
    'OutputActions', {'BNCState', 1, 'WavePlayer1', 1}); % 

sma = AddState(sma, 'Name', 'Olfacto_ON', ...        % allow a brief delay before an auditory cue (just to try)
    'Timer', 0.7,...
    'StateChangeConditions', {'Tup', 'Delay'},...
    'OutputActions', {'SoftCode',currentTrial(1,3)}); %

sma = AddState(sma, 'Name', 'Delay', ...
    'Timer', 0.6,...
    'StateChangeConditions', {'Tup', 'TrigAdamBox'},... 
    'OutputActions', {}); % 

sma = AddState(sma, 'Name', 'TrigAdamBox', ...        % trigger the odor machine from Adam's lab (Adam's machine will send a TS to plexon to record real odor delivery)
    'Timer', 0.01,...
    'StateChangeConditions', {'Tup', 'Delay_2'},...
    'OutputActions', {'BNCState', 2}); 

sma = AddState(sma, 'Name', 'Delay_2', ...        % allow a second delay before the delivery of a drop of water or sucrose (remain to be established the length of the delay here)
    'Timer', 1.4,...
    'StateChangeConditions', {'Tup', 'Olfacto_OFF'},...
    'OutputActions', {}); %

sma = AddState(sma, 'Name', 'Olfacto_OFF', ...
    'Timer', 1,...
    'StateChangeConditions', {'Tup', 'Delay_3'},...
    'OutputActions', {'SoftCode',currentTrial(1,4)}); % Sends serial message 1, opening the valve.

sma = AddState(sma, 'Name', 'Delay_3', ...
    'Timer', 2.5,...
    'StateChangeConditions', {'Tup', 'OpenValve'},...
    'OutputActions', {}); % Sends serial message 1

sma = AddState(sma, 'Name', 'OpenValve', ...
    'Timer', 0.001,...
    'StateChangeConditions', {'Tup', 'DelayValve'},...
    'OutputActions', {'ValveModule1',  1}); % Sends serial message 1, opening the valve.

sma = AddState(sma, 'Name', 'DelayValve', ...
    'Timer', time/1000,...
    'StateChangeConditions', {'Tup', 'CloseValve'},...
    'OutputActions', {}); % Sends serial message 1

sma = AddState(sma, 'Name', 'CloseValve', ...
    'Timer', 0,...
    'StateChangeConditions', {'Tup', 'MFC'},...
    'OutputActions', {'ValveModule1', 2}); % Sends serial message 2, closing the valve.

sma = AddState(sma, 'Name', 'MFC', ...
    'Timer', 0.5,...
    'StateChangeConditions', {'Tup', 'ITI'},...
    'OutputActions', {'SoftCode',255});

sma = AddState(sma, 'Name', 'ITI', ...
    'Timer',1,...
    'StateChangeConditions', {'Tup', '>exit'},...
    'OutputActions', {}); % Sends serial message 2 (Stop logging)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

SendStateMachine(sma);
RawEvents = RunStateMachine;

      if ~isempty(fieldnames(RawEvents)) % If you didn't stop the session manually mid-trial
        BpodSystem.Data = AddTrialEvents(BpodSystem.Data,RawEvents); % Adds raw events to a human-readable data struct
        BpodSystem.Data.TrialSettings(1)             = S; % Adds the settings used for the current trial to the Data struct (to be saved after the trial ends)
        %BpodSystem.Data.RawEvents.Trial{1,T}.Analog  = S.A.getData;
        BpodSystem.Data.RawEvents.Trial{1,T}.TasteID = currentTrial(1,1);
        BpodSystem.Data.RawEvents.Trial{1,T}.vial   = currentTrial(1,3);
        %BpodSystem.Data.RawEvents.Trial{1,T}.MFC(1,1) = S.MFC(1,1);
        %BpodSystem.Data.RawEvents.Trial{1,T}.MFC(1,2) = S.MFC(1,2);     
        BpodSystem.Data.RawEvents.Trial{1,T}.OdorID = S.setting.OdorID(currentTrial(1,3)).valve;
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
