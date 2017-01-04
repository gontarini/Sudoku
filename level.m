function varargout = level(varargin)
% LEVEL MATLAB code for level.fig
%      LEVEL, by itself, creates a new LEVEL or raises the existing
%      singleton*.
%
%      H = LEVEL returns the handle to a new LEVEL or the handle to
%      the existing singleton*.
%
%      LEVEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LEVEL.M with the given input arguments.
%
%      LEVEL('Property','Value',...) creates a new LEVEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before level_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to level_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help level

% Last Modified by GUIDE v2.5 21-Dec-2016 16:55:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @level_OpeningFcn, ...
                   'gui_OutputFcn',  @level_OutputFcn, ...
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


% --- Executes just before level is made visible.
function level_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to level (see VARARGIN)

% Choose default command line output for level
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes level wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = level_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in default.
function default_Callback(hObject, eventdata, handles)
% hObject    handle to default (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global loader;
loader = 0;
set(handles.uipanel1, 'visible', 'off');
p = uipanel('Title','choose_difficulty');

bg = uibuttongroup('Visible','off',...
                  'SelectionChangedFcn',@bselection);
              
% Create three radio buttons in the button group.
r1 = uicontrol(bg,'Style',...
                  'radiobutton',...
                  'String','Easy',...
                  'Position',[20 20 60 20],...
                  'HandleVisibility','off');
              
r2 = uicontrol(bg,'Style','radiobutton',...
                  'String','Medium',...
                  'Position',[20 50 60 20],...
                  'HandleVisibility','off');

r3 = uicontrol(bg,'Style','radiobutton',...
                  'String','Hard',...
                  'Position',[20 80 60 20],...
                  'HandleVisibility','off');
              
% Make the uibuttongroup visible after creating child objects. 
bg.Visible = 'on';
set(bg, 'SelectedObject', r1);

global difficulty;
difficulty = bg.SelectedObject.String;

btn = uicontrol('Style', 'pushbutton', 'String', 'CONFIRM',...
        'Position', [150 65 120 35],...
        'Callback', @pushed); 
btn = uicontrol('Style', 'pushbutton', 'String', 'MENU',...
    'Position', [150 20 120 35],...
    'Callback', @menu);

function bselection(source,callbackdata)
    global difficulty;
    difficulty = callbackdata.NewValue.String;
       
function pushed(source,callbackdata)
close('level');
board;

function menu(source,callbackdata)
close('level');
main;


% --- Executes on button press in create.
function create_Callback(hObject, eventdata, handles)
% hObject    handle to create (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global loader;
loader = 1; 

set(handles.uipanel1, 'visible', 'off');
p = uipanel('Title','choose difficulty');

bg = uibuttongroup('Visible','off',...
                  'SelectionChangedFcn',@bselection);
              
% Create three radio buttons in the button group.
r1 = uicontrol(bg,'Style',...
                  'radiobutton',...
                  'String','Easy',...
                  'Position',[20 20 60 20],...
                  'HandleVisibility','off');
              
r2 = uicontrol(bg,'Style','radiobutton',...
                  'String','Medium',...
                  'Position',[20 50 60 20],...
                  'HandleVisibility','off');

r3 = uicontrol(bg,'Style','radiobutton',...
                  'String','Hard',...
                  'Position',[20 80 60 20],...
                  'HandleVisibility','off');
              
% Make the uibuttongroup visible after creating child objects. 
bg.Visible = 'on';

btn = uicontrol('Style', 'pushbutton', 'String', 'CONFIRM',...
        'Position', [150 65 120 35],...
        'Callback', @pushed); 
btn = uicontrol('Style', 'pushbutton', 'String', 'MENU',...
    'Position', [150 20 120 35],...
    'Callback', @menu);

