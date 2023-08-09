function varargout = ZaberTemp(varargin)
% ZABERTEMP MATLAB code for ZaberTemp.fig
%      ZABERTEMP, by itself, creates a new ZABERTEMP or raises the existing
%      singleton*.
%
%      H = ZABERTEMP returns the handle to a new ZABERTEMP or the handle to
%      the existing singleton*.
%
%      ZABERTEMP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZABERTEMP.M with the given input arguments.
%
%      ZABERTEMP('Property','Value',...) creates a new ZABERTEMP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ZaberTemp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ZaberTemp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ZaberTemp

% Last Modified by GUIDE v2.5 21-Feb-2023 14:28:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ZaberTemp_OpeningFcn, ...
                   'gui_OutputFcn',  @ZaberTemp_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ZaberTemp is made visible.
function ZaberTemp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ZaberTemp (see VARARGIN)


addpath('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\ZaberTemp') ; 
A = exist('setting.mat');
if A == 2
    load('setting.mat');
    
handles.duration1 = setting.duration.v1; set(handles.durationvalve1_tag, 'string', num2str(handles.duration1));
handles.duration2 = setting.duration.v2; set(handles.durationvalve2_tag, 'string', num2str(handles.duration2));
handles.duration3 = setting.duration.v3; set(handles.durationvalve3_tag, 'string', num2str(handles.duration3));
handles.duration4 = setting.duration.v4; set(handles.durationvalve4_tag, 'string', num2str(handles.duration4));
handles.duration5 = setting.duration.v5; set(handles.durationvalve5_tag, 'string', num2str(handles.duration5));
handles.duration6 = setting.duration.v6; set(handles.durationvalve6_tag, 'string', num2str(handles.duration6));
handles.duration7 = setting.duration.v7; set(handles.durationvalve7_tag, 'string', num2str(handles.duration7));
handles.duration8 = setting.duration.v8; set(handles.durationvalve8_tag, 'string', num2str(handles.duration8));

handles.motor1_Spout1F = setting.motor.central.spout1_posF; set(handles.Motor1GetPosF1_tag, 'string', num2str(handles.motor1_Spout1F));
handles.motor1_Spout2F = setting.motor.central.spout2_posF; set(handles.Motor1GetPosF2_tag, 'string', num2str(handles.motor1_Spout2F));
handles.motor1_Spout3F = setting.motor.central.spout3_posF; set(handles.Motor1GetPosF3_tag, 'string', num2str(handles.motor1_Spout3F));
handles.motor1_Spout4F = setting.motor.central.spout4_posF; set(handles.Motor1GetPosF4_tag, 'string', num2str(handles.motor1_Spout4F));

handles.motor1_Spout1B = setting.motor.central.spout1_posB; set(handles.Motor1GetPosB1_tag, 'string', num2str(handles.motor1_Spout1B));
handles.motor1_Spout2B = setting.motor.central.spout2_posB; set(handles.Motor1GetPosB2_tag, 'string', num2str(handles.motor1_Spout2B));
handles.motor1_Spout3B = setting.motor.central.spout3_posB; set(handles.Motor1GetPosB3_tag, 'string', num2str(handles.motor1_Spout3B));
handles.motor1_Spout4B = setting.motor.central.spout4_posB; set(handles.Motor1GetPosB4_tag, 'string', num2str(handles.motor1_Spout4B));

handles.motor2_Spout1  = setting.motor.lateral.spout1_pos;  set(handles.Motor2GetPos1_tag, 'string', num2str(handles.motor2_Spout1)); 
handles.motor2_Spout2  = setting.motor.lateral.spout2_pos;  set(handles.Motor2GetPos2_tag, 'string', num2str(handles.motor2_Spout2)); 
handles.motor2_Spout3  = setting.motor.lateral.spout3_pos;  set(handles.Motor2GetPos3_tag, 'string', num2str(handles.motor2_Spout3)); 
handles.motor2_Spout4  = setting.motor.lateral.spout4_pos;  set(handles.Motor2GetPos4_tag, 'string', num2str(handles.motor2_Spout4)); 

handles.motor3_Spout1  = setting.motor.asp.spout1_pos;     set(handles.Motor3GetPos1_tag, 'string', num2str(handles.motor3_Spout1)); 
handles.motor3_Spout2  = setting.motor.asp.spout2_pos;     set(handles.Motor3GetPos2_tag, 'string', num2str(handles.motor3_Spout2)); 
handles.motor3_Spout3  = setting.motor.asp.spout3_pos;     set(handles.Motor3GetPos3_tag, 'string', num2str(handles.motor3_Spout3)); 
handles.motor3_Spout4  = setting.motor.asp.spout4_pos;     set(handles.Motor3GetPos4_tag, 'string', num2str(handles.motor3_Spout4)); 

handles.noflick       = setting.noflick      ;   set(handles.noflick_tag, 'string', num2str(handles.noflick));
handles.listoftaste   = setting.listoftaste  ;   set(handles.listoftaste_tag, 'string', num2str(handles.listoftaste));
handles.ITIrange      = setting.ITIrange     ;   set(handles.ITI_tag, 'string', num2str(handles.ITIrange));
handles.soundduration = setting.soundduration;   set(handles.soundduration_tag, 'string', num2str(handles.soundduration));
handles.trialnum      = setting.trialnumber  ;   set(handles.numberoftrials_tag, 'string', num2str(handles.trialnum));
handles.rinseline     = setting.rinseline    ;   set(handles.rinseline_tag, 'string', num2str(handles.rinseline));
handles.waitforlick   = setting.waitforlick  ;   set(handles.waitforlick_tag, 'string', num2str(handles.waitforlick));
handles.amountliquid  = setting.amountliquid ;   set(handles.amountliquid_tag, 'string', num2str(handles.amountliquid));

handles.motor1F = setting.motor.central.for ;    set(handles.Motor1Forw_tag, 'string', num2str(handles.motor1F));
handles.motor1B = setting.motor.central.bac ;    set(handles.Motor1Back_tag, 'string', num2str(handles.motor1B));
handles.motor2L = setting.motor.lateral.left;    set(handles.Motor2Left_tag, 'string', num2str(handles.motor2L)); 
handles.motor2R = setting.motor.lateral.right;   set(handles.Motor2Right_tag, 'string', num2str(handles.motor2R)); 
handles.motor3U = setting.motor.asp.up;          set(handles.Motor3Up_tag, 'string', num2str(handles.motor3U)); 
handles.motor3D = setting.motor.asp.down;        set(handles.Motor3Down_tag, 'string', num2str(handles.motor3D)); 

handles.analog.Reset = setting.analog.Reset;     set(handles.reset_tag, 'string', num2str(handles.analog.Reset));
handles.analog.Thresh = setting.analog.Thresh;   set(handles.threshold_tag, 'string', num2str(handles.analog.Thresh));

% setting defaults Taste ID
handles.taste1 = setting.stimID(1).valve;     set(handles.Taste1_tag, 'string', handles.taste1);
handles.taste2 = setting.stimID(2).valve;     set(handles.Taste2_tag, 'string', handles.taste2);
handles.taste3 = setting.stimID(3).valve;     set(handles.Taste3_tag, 'string', handles.taste3);
handles.taste4 = setting.stimID(4).valve;     set(handles.Taste4_tag, 'string', handles.taste4);
handles.taste5 = setting.stimID(5).valve;     set(handles.Taste5_tag, 'string', handles.taste5);
handles.taste6 = setting.stimID(6).valve;     set(handles.Taste6_tag, 'string', handles.taste6);
handles.taste7 = setting.stimID(7).valve;     set(handles.Taste7_tag, 'string', handles.taste7);
handles.taste8 = setting.stimID(8).valve;     set(handles.Taste8_tag, 'string', handles.taste8);

% setting defaults Taste ID
handles.vial_5 = setting.OdorID(5).valve;     set(handles.Vial5_tag, 'string', handles.vial_5);
handles.vial_6 = setting.OdorID(6).valve;     set(handles.Vial6_tag, 'string', handles.vial_6);
handles.vial_7 = setting.OdorID(7).valve;     set(handles.Vial7_tag, 'string', handles.vial_7);
handles.vial_8 = setting.OdorID(8).valve;     set(handles.Vial8_tag, 'string', handles.vial_8);
handles.vial_9 = setting.OdorID(9).valve;     set(handles.Vial9_tag, 'string', handles.vial_9);
handles.vial_10 = setting.OdorID(10).valve;     set(handles.Vial10_tag, 'string', handles.vial_10);
handles.vial_11 = setting.OdorID(11).valve;     set(handles.Vial11_tag, 'string', handles.vial_11);
handles.vial_12 = setting.OdorID(12).valve;     set(handles.Vial12_tag, 'string', handles.vial_12);
else

% set the default values for opening valve times
handles.duration1 = 20;             set(handles.durationvalve1_tag, 'string', num2str(handles.duration1));
handles.duration2 = 20;             set(handles.durationvalve2_tag, 'string', num2str(handles.duration2));
handles.duration3 = 20;             set(handles.durationvalve3_tag, 'string', num2str(handles.duration3));
handles.duration4 = 20;             set(handles.durationvalve4_tag, 'string', num2str(handles.duration4));
handles.duration5 = 20;             set(handles.durationvalve5_tag, 'string', num2str(handles.duration5));
handles.duration6 = 20;             set(handles.durationvalve6_tag, 'string', num2str(handles.duration6));
handles.duration7 = 20;             set(handles.durationvalve7_tag, 'string', num2str(handles.duration7));
handles.duration8 = 20;             set(handles.durationvalve8_tag, 'string', num2str(handles.duration8));

% setting defaults Odor ID in case of experiment with Adam
handles.vial_5 = 'empty'     ;     set(handles.Vial5_tag, 'string', handles.vial_5);
handles.vial_6 = 'empty'     ;     set(handles.Vial6_tag, 'string', handles.vial_6);
handles.vial_7 = 'empty'     ;     set(handles.Vial7_tag, 'string', handles.vial_7);
handles.vial_8 = 'empty'     ;     set(handles.Vial8_tag, 'string', handles.vial_8);
handles.vial_9 = 'empty'     ;     set(handles.Vial9_tag, 'string', handles.vial_9);
handles.vial_10 = 'empty'     ;     set(handles.Vial10_tag, 'string', handles.vial_10);
handles.vial_11 = 'empty'     ;     set(handles.Vial11_tag, 'string', handles.vial_11);
handles.vial_12 = 'empty'     ;     set(handles.Vial12_tag, 'string', handles.vial_12);

% set the default values for position of Zaber motors
% Motor 1 - central (COM9, device 1)
% Motor 2 - lateral (COM9, device 3)
% Motor 3 - aspiration (COM4, device 1)
handles.motor1F = 1002;             set(handles.Motor1Forw_tag, 'string', num2str(handles.motor1F));
handles.motor1B = 1001;             set(handles.Motor1Back_tag, 'string', num2str(handles.motor1B));
handles.motor2L = 12000;            set(handles.Motor2Left_tag, 'string', num2str(handles.motor2L)); 
handles.motor2R = 1001;             set(handles.Motor2Right_tag, 'string', num2str(handles.motor2R)); 
handles.motor3U = 1002;             set(handles.Motor3Up_tag, 'string', num2str(handles.motor3U)); 
handles.motor3D = 1001;             set(handles.Motor3Down_tag, 'string', num2str(handles.motor3D)); 

handles.motor1_Spout1F = 1001;
handles.motor1_Spout2F = 1001;
handles.motor1_Spout3F = 1001;
handles.motor1_Spout4F = 1001;
handles.motor1_Spout1B = 1002;
handles.motor1_Spout2B = 1002;
handles.motor1_Spout3B = 1002;
handles.motor1_Spout4B = 1002;
handles.motor2_Spout1  = 1001;      %set(handles.Motor2GetPos1_tag, 'string', num2str(handles.motor1F));
handles.motor2_Spout2  = 1001;
handles.motor2_Spout3  = 1001;
handles.motor2_Spout4  = 1001;
handles.motor3_Spout1  = 1001;
handles.motor3_Spout2  = 1001;
handles.motor3_Spout3  = 1001;
handles.motor3_Spout4  = 1001;

% setting the number of licks to trigger the taste
handles.noflick   = 5;                      set(handles.noflick_tag, 'string', num2str(handles.noflick));
% setting defaults Trial number
handles.trialnum = 5;                       set(handles.numberoftrials_tag, 'string', num2str(handles.trialnum));
% setting defaults List of taste ID/valves
handles.listoftaste = [1,2,3];              set(handles.listoftaste_tag, 'string', num2str(handles.listoftaste));
% setting defaults ITI range
handles.ITIrange = [0.1,0.2];               set(handles.ITI_tag, 'string', num2str(handles.ITIrange));
% setting defaults Sound duration
handles.soundduration = 0.8;                set(handles.soundduration_tag, 'string', num2str(handles.soundduration));
% setting defaults rinse line valve
handles.rinseline = 5;                      set(handles.rinseline_tag, 'string', num2str(handles.rinseline));
% setting defaults wait for lick in seconds
handles.waitforlick = 2;                    set(handles.waitforlick_tag, 'string', num2str(handles.waitforlick));
% setting defaults amounts of liquid (single drop) delivered from each valve
handles.amountliquid = 4;                   set(handles.amountliquid_tag, 'string', num2str(handles.amountliquid));


handles.analog.Reset = 2;                        set(handles.threshold_tag, 'string', num2str(handles.analog.Reset));
handles.analog.Thresh = 7;                       set(handles.threshold_tag, 'string', num2str(handles.analog.Thresh));

end
% Choose default command line output for ZaberTemp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ZaberTemp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ZaberTemp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Executes on button press in pushbutton_start.
function pushbutton_start_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cd('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\ZaberTemp');
%
duration.v1 = handles.duration1;      
duration.v2 = handles.duration2;           
duration.v3 = handles.duration3;                
duration.v4 = handles.duration4;           
duration.v5 = handles.duration5;              
duration.v6 = handles.duration6;     
duration.v7 = handles.duration7;     
duration.v8 = handles.duration8;     

motor.central.for              =  handles.motor1F; 
motor.central.bac              =  handles.motor1B; 

motor.central.spout1_posF =  handles.motor1_Spout1F;
motor.central.spout2_posF =  handles.motor1_Spout2F;
motor.central.spout3_posF =  handles.motor1_Spout3F;
motor.central.spout4_posF =  handles.motor1_Spout4F;
motor.central.spout1_posB =  handles.motor1_Spout1B;
motor.central.spout2_posB =  handles.motor1_Spout2B;
motor.central.spout3_posB =  handles.motor1_Spout3B;
motor.central.spout4_posB =  handles.motor1_Spout4B;

motor.lateral.left        =  handles.motor2L;  
motor.lateral.right       =  handles.motor2R;  
motor.lateral.spout1_pos  =  handles.motor2_Spout1; 
motor.lateral.spout2_pos  =  handles.motor2_Spout2; 
motor.lateral.spout3_pos  =  handles.motor2_Spout3; 
motor.lateral.spout4_pos  =  handles.motor2_Spout4; 

motor.asp.up              =  handles.motor3U; 
motor.asp.down            =  handles.motor3D; 

motor.asp.spout1_pos      = handles.motor3_Spout1;
motor.asp.spout2_pos      = handles.motor3_Spout2;
motor.asp.spout3_pos      = handles.motor3_Spout3;
motor.asp.spout4_pos      = handles.motor3_Spout4;

noflick                   = handles.noflick;
trialnum                  = handles.trialnum;
listoftaste               = handles.listoftaste;
ITIrange                  = handles.ITIrange;
soundduration             = handles.soundduration;
rinseline                 = handles.rinseline;
waitforlick               = handles.waitforlick;
amountliquid              = handles.amountliquid;
stimID(1).valve           = handles.taste1; 
stimID(2).valve           = handles.taste2;
stimID(3).valve           = handles.taste3; 
stimID(4).valve           = handles.taste4;
stimID(5).valve           = handles.taste5; 
stimID(6).valve           = handles.taste6;
stimID(7).valve           = handles.taste7;
stimID(8).valve           = handles.taste8;
OdorID(5).valve           = handles.vial_5; 
OdorID(6).valve           = handles.vial_6;
OdorID(7).valve           = handles.vial_7; 
OdorID(8).valve           = handles.vial_8;
OdorID(9).valve           = handles.vial_9; 
OdorID(10).valve           = handles.vial_10;
OdorID(11).valve           = handles.vial_11;
OdorID(12).valve           = handles.vial_12;
analog.Thresh = handles.analog.Thresh;
analog.Reset = handles.analog.Reset;

setting = struct('duration',duration,...
                 'motor',motor,...
                 'trialnumber',trialnum,...
                 'listoftaste',listoftaste,...
                 'ITIrange',ITIrange,...
                 'soundduration',soundduration,...
                 'noflick',noflick,...
                 'stimID',stimID,...
                 'rinseline',rinseline,...
                 'waitforlick',waitforlick,...
                 'amountliquid',amountliquid,...
                 'analog',analog,...
                 'OdorID',OdorID);
             
save('setting','setting');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Push button callback solenoid valves - to open valves for a specified
% time increment
% --- Executes on button press in pushbutton_valve1. 
function pushbutton_valve1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_valve1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ModuleWrite('ValveModule1', 'O1'); %O1 = open valve 1
duration = handles.duration1/1000;
tic
pause(duration)
toc
ModuleWrite('ValveModule1', 'C1'); %C1 = close valve 1

guidata(hObject, handles); % save 

% --- Executes on button press in pushbutton_valve2. 
function pushbutton_valve2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_valve2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ModuleWrite('ValveModule1', 'O2'); %
duration = handles.duration2/1000;
tic
pause(duration)
toc
ModuleWrite('ValveModule1', 'C2');

guidata(hObject, handles); % save 

% --- Executes on button press in pushbutton_valve3.
function pushbutton_valve3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_valve3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ModuleWrite('ValveModule1', 'O3');
duration = handles.duration3/1000;
tic
pause(duration)
toc
ModuleWrite('ValveModule1', 'C3');

guidata(hObject, handles); % save 

% --- Executes on button press in pushbutton_valve4.
function pushbutton_valve4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_valve4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ModuleWrite('ValveModule1', 'O4');
duration = handles.duration4/1000;
tic
pause(duration)
toc
ModuleWrite('ValveModule1', 'C4');

guidata(hObject, handles); % save 

% --- Executes on button press in pushbutton_valve5.
function pushbutton_valve5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_valve5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ModuleWrite('ValveModule1', 'O5');
duration = handles.duration5/1000;
tic
pause(duration)
toc
ModuleWrite('ValveModule1', 'C5');

guidata(hObject, handles); % save 

% --- Executes on button press in pushbutton_valve6.
function pushbutton_valve6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_valve6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ModuleWrite('ValveModule1', 'O6');
duration = handles.duration6/1000;
tic
pause(duration)
toc
ModuleWrite('ValveModule1', 'C6');

guidata(hObject, handles); % save

% --- Executes on button press in pushbutton_valve7.
function pushbutton_valve7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_valve7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ModuleWrite('ValveModule1', 'O7');
duration = handles.duration7/1000;
tic
pause(duration)
toc
ModuleWrite('ValveModule1', 'C7');

guidata(hObject, handles); % save

% --- Executes on button press in pushbutton_valve8.
function pushbutton_valve8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_valve8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ModuleWrite('ValveModule1', 'O8');
duration = handles.duration8/1000;
tic
pause(duration)
toc
ModuleWrite('ValveModule1', 'C8');

guidata(hObject, handles); % save

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tag for opening time in the GUI
% Valve 1 ----------------
function durationvalve1_tag_Callback(hObject, eventdata, handles)
% hObject    handle to durationvalve1_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of durationvalve1_tag as text
%        str2double(get(hObject,'String')) returns contents of durationvalve1_tag as a double
handles.duration1 = str2double(get(hObject,'String'));
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function durationvalve1_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to durationvalve1_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% Valve 2 ----------------
function durationvalve2_tag_Callback(hObject, eventdata, handles)
% hObject    handle to durationvalve2_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of durationvalve2_tag as text
%        str2double(get(hObject,'String')) returns contents of durationvalve2_tag as a double
handles.duration2 = str2double(get(hObject,'String'));
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function durationvalve2_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to durationvalve2_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% Valve 3 ----------------
function durationvalve3_tag_Callback(hObject, eventdata, handles)
% hObject    handle to durationvalve3_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of durationvalve3_tag as text
%        str2double(get(hObject,'String')) returns contents of durationvalve3_tag as a double

handles.duration3 = str2double(get(hObject,'String'));
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function durationvalve3_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to durationvalve3_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Valve 4 ----------------
function durationvalve4_tag_Callback(hObject, eventdata, handles)
% hObject    handle to durationvalve4_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of durationvalve4_tag as text
%        str2double(get(hObject,'String')) returns contents of durationvalve4_tag as a double
handles.duration4 = str2double(get(hObject,'String'));
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function durationvalve4_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to durationvalve4_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Valve 5 ----------------
function durationvalve5_tag_Callback(hObject, eventdata, handles)
% hObject    handle to durationvalve5_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of durationvalve5_tag as text
%        str2double(get(hObject,'String')) returns contents of durationvalve5_tag as a double
handles.duration5 = str2double(get(hObject,'String'));
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function durationvalve5_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to durationvalve5_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% Valve 6 -------------
function durationvalve6_tag_Callback(hObject, eventdata, handles)
% hObject    handle to durationvalve6_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of durationvalve6_tag as text
%        str2double(get(hObject,'String')) returns contents of durationvalve6_tag as a double
handles.duration6 = str2double(get(hObject,'String'));
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function durationvalve6_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to durationvalve6_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Valve 7 -------------
function durationvalve7_tag_Callback(hObject, eventdata, handles)
% hObject    handle to durationvalve7_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of durationvalve7_tag as text
%        str2double(get(hObject,'String')) returns contents of durationvalve7_tag as a double
handles.duration7 = str2double(get(hObject,'String'));
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function durationvalve7_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to durationvalve7_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Valve 8 -------------
function durationvalve8_tag_Callback(hObject, eventdata, handles)
% hObject    handle to durationvalve8_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of durationvalve8_tag as text
%        str2double(get(hObject,'String')) returns contents of durationvalve8_tag as a double
handles.duration8 = str2double(get(hObject,'String'));
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function durationvalve8_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to durationvalve8_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% keep tagging on....
% Taste ID valve inputs
% looks at the beginning of the script for the default TasteID input for taste1

function Taste1_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Taste1_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Taste1_tag as text
%        str2double(get(hObject,'String')) returns contents of Taste1_tag as a double
handles.taste1 = get(hObject,'String');
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Taste1_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Taste1_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%------------------------------

%looks at the beginning of the script for the default TasteID input for
%taste2
function Taste2_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Taste2_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Taste2_tag as text
%        str2double(get(hObject,'String')) returns contents of Taste2_tag as a double
handles.taste2 = get(hObject,'String');
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Taste2_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Taste2_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%---------------------------------------

%looks at the beginning of the script for the default TasteID input for
%taste3
function Taste3_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Taste3_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Taste3_tag as text
%        str2double(get(hObject,'String')) returns contents of Taste3_tag as a double
handles.taste3 = get(hObject,'String');
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Taste3_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Taste3_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%------------------------------------------

%looks at the beginning of the script for the default TasteID input for
%taste4
function Taste4_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Taste4_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Taste4_tag as text
%        str2double(get(hObject,'String')) returns contents of Taste4_tag as a double
handles.taste4 = get(hObject,'String');
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Taste4_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Taste4_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%-----------------------------------------

%looks at the beginning of the script for the default TasteID input for
%taste5
function Taste5_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Taste5_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Taste5_tag as text
%        str2double(get(hObject,'String')) returns contents of Taste5_tag as a double
handles.taste5 = get(hObject,'String');
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Taste5_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Taste5_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%----------------------------------------

%looks at the beginning of the script for the default TasteID input for
%taste6
function Taste6_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Taste6_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Taste6_tag as text
%        str2double(get(hObject,'String')) returns contents of Taste6_tag as a double
handles.taste6 = get(hObject,'String');
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Taste6_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Taste6_tag (see GCBO) eventdata  reserved - to be
% defined in a future version of MATLAB handles    empty - handles not
% created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Taste7_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Taste7_tag (see GCBO) eventdata  reserved - to be
% defined in a future version of MATLAB handles    structure with handles
% and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Taste7_tag as text
%        str2double(get(hObject,'String')) returns contents of Taste7_tag
%        as a double
handles.taste7 = get(hObject,'String');
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Taste7_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Taste7_tag (see GCBO) eventdata  reserved - to be
% defined in a future version of MATLAB handles    empty - handles not
% created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Taste8_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Taste8_tag (see GCBO) eventdata  reserved - to be
% defined in a future version of MATLAB handles    structure with handles
% and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Taste8_tag as text
%        str2double(get(hObject,'String')) returns contents of Taste8_tag
%        as a double
handles.taste8 = get(hObject,'String');
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Taste8_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Taste8_tag (see GCBO) eventdata  reserved - to be
% defined in a future version of MATLAB handles    empty - handles not
% created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Motor executions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------- Motor 1 Central --------------------------------------------

% --- Executes on button press in pushbutton_Motor1Forw.
function pushbutton_Motor1Forw_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor1Forw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

moveZ(handles.motor1F,1,'COM9');
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor1Back.
function pushbutton_Motor1Back_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor1Back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

moveZ(handles.motor1B,1,'COM9');
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor1Home.
function pushbutton_Motor1Home_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor1Home (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
moveZ(1001,1,'COM9');
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor1GetPos1.
function pushbutton_Motor1GetPos1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor1GetPos1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[reply] = posZ(1,'COM9');
handles.motor1_Spout1F = str2double(reply.data);
set(handles.Motor1GetPosF1_tag, 'string', num2str(handles.motor1_Spout1F));
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor1GoPos1.
function pushbutton_Motor1GoPos1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor1GoPos1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
moveZ(1001,1,'COM4');
moveZ(handles.motor1_Spout1F,1,'COM9');
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor1GetPos2.
function pushbutton_Motor1GetPos2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor1GetPos2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[reply] = posZ(1,'COM9');
handles.motor1_Spout2F = str2double(reply.data);
set(handles.Motor1GetPosF2_tag, 'string', num2str(handles.motor1_Spout2F));
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor1GoPos2.
function pushbutton_Motor1GoPos2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor1GoPos2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
moveZ(1001,1,'COM4');
moveZ(handles.motor1_Spout2F,1,'COM9');
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor1GetPos3.
function pushbutton_Motor1GetPos3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor1GetPos3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[reply] = posZ(1,'COM9');
handles.motor1_Spout3F = str2double(reply.data);
set(handles.Motor1GetPosF3_tag, 'string', num2str(handles.motor1_Spout3F));
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor1GoPos3.
function pushbutton_Motor1GoPos3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor1GoPos3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
moveZ(1001,1,'COM4');
moveZ(handles.motor1_Spout3F,1,'COM9');
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor1GetPos4.
function pushbutton_Motor1GetPos4_Callback(hObject, eventdata, handles)
[reply] = posZ(1,'COM9');
handles.motor1_Spout4F = str2double(reply.data);
set(handles.Motor1GetPosF4_tag, 'string', num2str(handles.motor1_Spout4F));
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor1GoPos4.
function pushbutton_Motor1GoPos4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor1GoPos4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
moveZ(1001,1,'COM4');
moveZ(handles.motor1_Spout4F,1,'COM9');
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor1GetPos1B.
function pushbutton_Motor1GetPos1B_Callback(hObject, eventdata, handles)
[reply] = posZ(1,'COM9');
handles.motor1_Spout1B = str2double(reply.data);
set(handles.Motor1GetPosB1_tag, 'string', num2str(handles.motor1_Spout1B));
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor1GetPos2B.
function pushbutton_Motor1GetPos2B_Callback(hObject, eventdata, handles)
[reply] = posZ(1,'COM9');
handles.motor1_Spout2B = str2double(reply.data);
set(handles.Motor1GetPosB2_tag, 'string', num2str(handles.motor1_Spout2B));
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor1GetPos3B.
function pushbutton_Motor1GetPos3B_Callback(hObject, eventdata, handles)
[reply] = posZ(1,'COM9');
handles.motor1_Spout3B = str2double(reply.data);
set(handles.Motor1GetPosB3_tag, 'string', num2str(handles.motor1_Spout3B));
guidata(hObject, handles);

function pushbutton_Motor1GetPos4B_Callback(hObject, eventdata, handles)
[reply] = posZ(1,'COM9');
handles.motor1_Spout4B = str2double(reply.data);
set(handles.Motor1GetPosB4_tag, 'string', num2str(handles.motor1_Spout4B));
guidata(hObject, handles);

%##########################################################################
%--------------- Motor 2 Lateral ------------------------------------------

% --- Executes on button press in pushbutton_Motor2Left.
function pushbutton_Motor2Left_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor2Left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
moveZ(1001,1,'COM9');
moveZ(1001,1,'COM4');
moveZ(handles.motor2L,3,'COM9');
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor2Right.
function pushbutton_Motor2Right_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor2Right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
moveZ(1001,1,'COM9');
moveZ(1001,1,'COM4');
moveZ(handles.motor2R,3,'COM9');
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor2Home.
function pushbutton_Motor2Home_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor2Home (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

moveZ(1001,3,'COM9');
guidata(hObject, handles);

% Acquires current position for the lateral motor after manually aligning
% the spouts for the animal

% --- Executes on button press in pushbutton_Motor2GetPos1.
function pushbutton_Motor2GetPos1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor2GetPos1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[reply] = posZ(3,'COM9');
handles.motor2_Spout1 = str2double(reply.data);
set(handles.Motor2GetPos1_tag, 'string', num2str(handles.motor2_Spout1));
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor2GoPos1.
function pushbutton_Motor2GoPos1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor2GoPos1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
moveZ(1001,1,'COM4');
moveZ(1001,1,'COM9');
moveZ(handles.motor2_Spout1,3,'COM9');
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor2GetPos2.
function pushbutton_Motor2GetPos2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor2GetPos2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[reply] = posZ(3,'COM9');
handles.motor2_Spout2 = str2double(reply.data);
set(handles.Motor2GetPos2_tag, 'string', num2str(handles.motor2_Spout2));
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor2GoPos1.
function pushbutton_Motor2GoPos2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor2GoPos1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
moveZ(1001,1,'COM4');
moveZ(1001,1,'COM9');
moveZ(handles.motor2_Spout2,3,'COM9');
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor2GetPos3.
function pushbutton_Motor2GetPos3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor2GetPos3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[reply] = posZ(3,'COM9');
handles.motor2_Spout3 = str2double(reply.data);
set(handles.Motor2GetPos3_tag, 'string', num2str(handles.motor2_Spout3));
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor2GoPos1.
function pushbutton_Motor2GoPos3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor2GoPos1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
moveZ(1001,1,'COM4');
moveZ(1001,1,'COM9');
moveZ(handles.motor2_Spout3,3,'COM9');
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor2GetPos4.
function pushbutton_Motor2GetPos4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor2GetPos4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[reply] = posZ(3,'COM9');
handles.motor2_Spout4 = str2double(reply.data);
set(handles.Motor2GetPos4_tag, 'string', num2str(handles.motor2_Spout4));
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor2GoPos1.
function pushbutton_Motor2GoPos4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor2GoPos1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
moveZ(1001,1,'COM4');
moveZ(1001,1,'COM9');
moveZ(handles.motor2_Spout4,3,'COM9');
guidata(hObject, handles);

%##########################################################################
%--------------- Motor 3 Aspiration ---------------------------------------

% --- Executes on button press in pushbutton_Motor3Up.
function pushbutton_Motor3Up_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor3Up (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
set(0, 'DefaultUIControlFontSize', 40);
m = menu('Make sure the aspiration spout is misaligned with the central one!!!!','ok');
set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak);
moveZ(handles.motor3U,1,'COM4');
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor3Down.
function pushbutton_Motor3Down_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor3Down (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

moveZ(handles.motor3D,1,'COM4');
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor3Home.
function pushbutton_Motor3Home_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor3Home (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

moveZ(1001,1,'COM4');
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor3GetPos1.
function pushbutton_Motor3GetPos1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor3GetPos1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[reply] = posZ(1,'COM4');
handles.motor3_Spout1 = str2double(reply.data);
set(handles.Motor3GetPos1_tag, 'string', num2str(handles.motor3_Spout1));
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor3GetPos2.
function pushbutton_Motor3GetPos2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor3GetPos2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[reply] = posZ(1,'COM4');
handles.motor3_Spout2 = str2double(reply.data);
set(handles.Motor3GetPos2_tag, 'string', num2str(handles.motor3_Spout2));
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor3GoPos2.
function pushbutton_Motor3GoPos2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor3GoPos2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
set(0, 'DefaultUIControlFontSize', 40);
m = menu('Make sure the aspiration spout is misaligned with the central one!!!!','ok');
set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak);
moveZ(handles.motor3_Spout2,1,'COM4');
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor3GetPos3.
function pushbutton_Motor3GetPos3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor3GetPos3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[reply] = posZ(1,'COM4');
handles.motor3_Spout3 = str2double(reply.data);
set(handles.Motor3GetPos3_tag, 'string', num2str(handles.motor3_Spout3));
guidata(hObject, handles);

function pushbutton_Motor3GoPos3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor3GoPos2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
set(0, 'DefaultUIControlFontSize', 40);
m = menu('Make sure the aspiration spout is misaligned with the central one!!!!','ok');
set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak);
moveZ(handles.motor3_Spout3,1,'COM4');
guidata(hObject, handles);

% --- Executes on button press in pushbutton_Motor3GetPos4.
function pushbutton_Motor3GetPos4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor3GetPos4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[reply] = posZ(1,'COM4');
handles.motor3_Spout4 = str2double(reply.data);
set(handles.Motor3GetPos4_tag, 'string', num2str(handles.motor3_Spout4));
guidata(hObject, handles);

function pushbutton_Motor3GoPos4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Motor3GoPos2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
set(0, 'DefaultUIControlFontSize', 40);
m = menu('Make sure the aspiration spout is misaligned with the central one!!!!','ok');
set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak);
moveZ(handles.motor3_Spout4,1,'COM4');
guidata(hObject, handles);

%##########################################################################
%--------------- End section on Motor 3 Aspiration ------------------------


% Update calibration %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pushbutton_updatecalibration.
function pushbutton_updatecalibration_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_updatecalibration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cd('C:\Users\VincisLab-2\Documents\MATLAB\Bpod Local\Calibration Files\');
temp = load('LiquidCalibration.mat');
for i = [1:5,7:8]
  temp.LiquidCal(i).Table(:,3) = abs(temp.LiquidCal(i).Table(:,2)-handles.amountliquid);
  temp.LiquidCal(i).Table      = sortrows(temp.LiquidCal(i).Table,3);
end

 handles.duration1 = temp.LiquidCal(1).Table(1,1);  set(handles.durationvalve1_tag, 'string', num2str(handles.duration1));
 handles.duration2 = temp.LiquidCal(2).Table(1,1);  set(handles.durationvalve2_tag, 'string', num2str(handles.duration2));
 handles.duration3 = temp.LiquidCal(3).Table(1,1);  set(handles.durationvalve3_tag, 'string', num2str(handles.duration3));
 handles.duration4 = temp.LiquidCal(4).Table(1,1);  set(handles.durationvalve4_tag, 'string', num2str(handles.duration4));
 handles.duration5 = temp.LiquidCal(5).Table(1,1);  set(handles.durationvalve5_tag, 'string', num2str(handles.duration5));
 %handles.duration6 = temp.LiquidCal(6).Table(1,1);  set(handles.durationvalve6_tag, 'string', num2str(handles.duration6));
 handles.duration7 = temp.LiquidCal(7).Table(1,1);  set(handles.durationvalve7_tag, 'string', num2str(handles.duration7));
 handles.duration8 = temp.LiquidCal(8).Table(1,1);  set(handles.durationvalve8_tag, 'string', num2str(handles.duration8));

 clear temp;
 cd('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\ZaberTemp') ; 
 guidata(hObject, handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Motor tags

% Motor 1 Forward tag ------------------------------------------------------------------------------

function Motor1Forw_tag_Callback(hObject, eventdata, handles)
% hObject    handle to durationvalve5_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.motor1F = str2double(get(hObject,'String'));
guidata(hObject, handles);

% Hints: get(hObject,'String') returns contents of durationvalve5_tag as text
%        str2double(get(hObject,'String')) returns contents of durationvalve5_tag as a double
% --- Executes during object creation, after setting all properties.
function Motor1Forw_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Motor1Forw_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Motor 1 Backward tag ------------------------------------------------------------------------------

function Motor1Back_tag_Callback(hObject, eventdata, handles)
% hObject    handle to durationvalve5_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.motor1B = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Motor1Back_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Motor1Back_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Motor 2 Left tag ------------------------------------------------------------------------------

function Motor2Left_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Motor2Left_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Motor2Left_tag as text
%        str2double(get(hObject,'String')) returns contents of Motor2Left_tag as a double
handles.motor2L = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Motor2Left_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Motor2Left_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Motor 2 Right tag ------------------------------------------------------------------------------

function Motor2Right_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Motor2Right_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Motor2Right_tag as text
%        str2double(get(hObject,'String')) returns contents of Motor2Right_tag as a double
handles.motor2R = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Motor2Right_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Motor2Right_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Motor 3 Up tag ------------------------------------------------------------------------------

function Motor3Up_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Motor3Up_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Motor3Up_tag as text
%        str2double(get(hObject,'String')) returns contents of Motor3Up_tag as a double
handles.motor3U = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Motor3Up_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Motor3Up_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Motor 3 Down tag ------------------------------------------------------------------------------

function Motor3Down_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Motor3Down_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Motor3Down_tag as text
%        str2double(get(hObject,'String')) returns contents of Motor3Down_tag as a double
handles.motor3D = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Motor3Down_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Motor3Down_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Trial settings

% Number of trials -----------------------------------------------

function numberoftrials_tag_Callback(hObject, eventdata, handles)
% hObject    handle to numberoftrials_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numberoftrials_tag as text
%        str2double(get(hObject,'String')) returns contents of numberoftrials_tag as a double
handles.trialnum = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function numberoftrials_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numberoftrials_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% List of taste ID/valves -----------------------------------------------

function listoftaste_tag_Callback(hObject, eventdata, handles)
% hObject    handle to listoftaste_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of listoftaste_tag as text
%        str2double(get(hObject,'String')) returns contents of listoftaste_tag as a double
handles.listoftaste = str2num(get(hObject,'String')); % leave it as str2num
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function listoftaste_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listoftaste_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% List of taste ID/valves -----------------------------------------------

function ITI_tag_Callback(hObject, eventdata, handles)
% hObject    handle to ITI_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ITI_tag as text
%        str2double(get(hObject,'String')) returns contents of ITI_tag as a double
handles.ITIrange = str2num(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function ITI_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ITI_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Sound duration -----------------------------------------------

function soundduration_tag_Callback(hObject, eventdata, handles)
% hObject    handle to soundduration_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of soundduration_tag as text
%        str2double(get(hObject,'String')) returns contents of soundduration_tag as a double
handles.soundduration = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function soundduration_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to soundduration_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function noflick_tag_Callback(hObject, eventdata, handles)
% hObject    handle to noflick_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of noflick_tag as text
%        str2double(get(hObject,'String')) returns contents of noflick_tag as a double
handles.noflick = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function noflick_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to noflick_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function rinseline_tag_Callback(hObject, eventdata, handles)
% hObject    handle to rinseline_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rinseline_tag as text
%        str2double(get(hObject,'String')) returns contents of rinseline_tag as a double
handles.rinseline = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function rinseline_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rinseline_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function waitforlick_tag_Callback(hObject, eventdata, handles)
% hObject    handle to waitforlick_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of waitforlick_tag as text
%        str2double(get(hObject,'String')) returns contents of waitforlick_tag as a double
handles.waitforlick = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function waitforlick_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to waitforlick_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function amountliquid_tag_Callback(hObject, eventdata, handles)
% hObject    handle to amountliquid_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amountliquid_tag as text
%        str2double(get(hObject,'String')) returns contents of amountliquid_tag as a double
handles.amountliquid = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function amountliquid_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amountliquid_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%-------------------Start protocol commands--------------------------------

% --- Executes on button press in pushbutton_testLicks.
function pushbutton_testLicks_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_testLicks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
addpath('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\TestLick') ; 
cd('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\TestLick');
run('TestLick.m');
cd('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\ZaberTemp');
guidata(hObject, handles);

%to change
% --- Executes on button press in pushbutton_startprotocol1.
function pushbutton_startprotocol1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_startprotocol1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pushbutton_start_Callback(hObject,eventdata,handles);
addpath('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\NewTasteProtocols') ; 
cd('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\NewTasteProtocols');
%here add the if statement and load the correct protocol based on n of lick
% if handles.noflick == 1
%    run('NewTaste_OneLick.m'); 
% elseif handles.noflick == 2
%     run('NewTaste_TwoLick.m'); 
% elseif handles.noflick == 3
%     run('NewTaste_ThreeLick.m'); 
% elseif handles.noflick == 4
%     run('NewTaste_FourLick.m'); 
% elseif handles.noflick == 5
%     run('NewTaste_FiveLick.m'); 
% elseif handles.noflick == 6
%     run('NewTaste_SixLick.m'); 
% elseif handles.noflick == 7
%     run('NewTaste_SevenLick.m'); 
% end
run('NewTaste_SevenLick_NewDetection.m');
cd('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\ZaberTemp');
guidata(hObject, handles);

% --- Executes on button press in pushbutton_startprotocol2.
function pushbutton_startprotocol2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_startprotocol2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pushbutton_start_Callback(hObject,eventdata,handles);
addpath('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\NewTempProtocols') ; 
cd('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\NewTempProtocols');



if (length(handles.listoftaste)>3)
    UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
    set(0, 'DefaultUIControlFontSize', 40);
    m = menu('Make sure the TasteID length is < 4 and that taste lines are 6, 7 or 8','ok');
    set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak); 
    
elseif (length(handles.listoftaste)==3)&&(handles.listoftaste(1)==1 ||...
                                         handles.listoftaste(1)==2 ||...
                                         handles.listoftaste(1)==3 ||...
                                         handles.listoftaste(1)==4 ||...
                                         handles.listoftaste(1)==5 ||...
                                         handles.listoftaste(2)==1 ||...
                                         handles.listoftaste(2)==2 ||...
                                         handles.listoftaste(2)==3 ||...
                                         handles.listoftaste(2)==4 ||...
                                         handles.listoftaste(2)==5 ||...
                                         handles.listoftaste(3)==1 ||...
                                         handles.listoftaste(3)==2 ||...
                                         handles.listoftaste(3)==3 ||...
                                         handles.listoftaste(3)==4 ||...
                                         handles.listoftaste(3)==5)
        UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
        set(0, 'DefaultUIControlFontSize', 40);
        m = menu('Make sure the TasteID length is < 4 and that taste lines are 6, 7 or 8','ok');
        set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak); 
elseif (length(handles.listoftaste)==2)&&(handles.listoftaste(1)==1 ||...
                                         handles.listoftaste(1)==2 ||...
                                         handles.listoftaste(1)==3 ||...
                                         handles.listoftaste(1)==4 ||...
                                         handles.listoftaste(1)==5 ||...
                                         handles.listoftaste(2)==1 ||...
                                         handles.listoftaste(2)==2 ||...
                                         handles.listoftaste(2)==3 ||...
                                         handles.listoftaste(2)==4 ||...
                                         handles.listoftaste(2)==5)
        UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
        set(0, 'DefaultUIControlFontSize', 40);
        m = menu('Make sure the taste lines are 6, 7 or 8','ok');
        set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak);
        
elseif (length(handles.listoftaste)==1)&&(handles.listoftaste(1)==1 ||...
                                         handles.listoftaste(1)==2 ||...
                                         handles.listoftaste(1)==3 ||...
                                         handles.listoftaste(1)==4 ||...
                                         handles.listoftaste(1)==5)
        UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
        set(0, 'DefaultUIControlFontSize', 40);
        m = menu('Make sure the taste lines are 6, 7 or 8','ok');
        set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak);
else
    if handles.noflick == 1
              run('NewTemp_SevenLick.m');
         elseif handles.noflick == 2
              run('NewTemp_SevenLick.m');
         elseif handles.noflick == 3
              run('NewTemp_SevenLick.m');
         elseif handles.noflick == 4
              run('NewTemp_SevenLick.m');
         elseif handles.noflick == 5
              run('NewTemp_SevenLick.m');
         elseif handles.noflick == 6
              run('NewTemp_SevenLick.m');
        elseif handles.noflick == 7
              run('NewTemp_SevenLick.m');
    else
    end
end

cd('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\ZaberTemp');
guidata(hObject, handles);


% --- Executes on button press in pushbutton55.
function pushbutton55_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pushbutton_start_Callback(hObject,eventdata,handles);
addpath('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\NewTempProtocols') ; 
cd('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\NewTempProtocols');
run('NewTemp_SevenLick_ForAdam.m');

cd('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\ZaberTemp');
guidata(hObject, handles);

% --- Executes on button press in pushbutton66.
function pushbutton66_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton66 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pushbutton_start_Callback(hObject,eventdata,handles);
addpath('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\NewTempProtocols') ; 
cd('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\NewTempProtocols');
run('NewTaste_and_Temp_SevenLick.m');

cd('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\ZaberTemp');
guidata(hObject, handles);

% --- Executes on button press in pushbutton67.
function pushbutton67_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton67 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pushbutton_start_Callback(hObject,eventdata,handles);
addpath('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\NewTempProtocols') ; 
cd('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\NewTempProtocols');
run('Conc_NewTaste_and_Temp_SevenLick.m');

cd('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\ZaberTemp');
guidata(hObject, handles);

% --- Executes on button press in pushbutton68.
function pushbutton68_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton68 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pushbutton_start_Callback(hObject,eventdata,handles);
addpath('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\NewTempProtocols') ; 
cd('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\NewTempProtocols');
run('NewTaste_and_Temp_SevenLick_no_rinse.m');

cd('C:\Users\VincisLab-2\Documents\MATLAB\Bpod_Gen2-master\Examples\Protocols\ZaberTemp');
guidata(hObject, handles);

function threshold_tag_Callback(hObject, eventdata, handles)
% hObject    handle to threshold_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of threshold_tag as text
%        str2double(get(hObject,'String')) returns contents of threshold_tag as a double
handles.analog.Thresh   = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function threshold_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to threshold_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function reset_tag_Callback(hObject, eventdata, handles)
% hObject    handle to reset_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of reset_tag as text
%        str2double(get(hObject,'String')) returns contents of reset_tag as a double
handles.analog.Reset   = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function reset_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to reset_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Vial5_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Vial5_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.vial_5 = get(hObject,'String');
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function Vial5_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vial5_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Vial6_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Vial6_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.vial_6 = get(hObject,'String');
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function Vial6_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vial6_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Vial7_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Vial7_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.vial_7 = get(hObject,'String');
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function Vial7_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vial7_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Vial8_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Vial8_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.vial_8 = get(hObject,'String');
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function Vial8_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vial8_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Vial9_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Vial9_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.vial_9 = get(hObject,'String');
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function Vial9_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vial9_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Vial10_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Vial10_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.vial_10 = get(hObject,'String');
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function Vial10_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vial10_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Vial11_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Vial11_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.vial_11 = get(hObject,'String');
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function Vial11_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vial11_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Vial12_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Vial12_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.vial_12 = get(hObject,'String');
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function Vial12_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vial12_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
