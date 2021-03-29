function varargout = testfig(varargin)
% TESTFIG MATLAB code for testfig.fig
%      TESTFIG, by itself, creates a new TESTFIG or raises the existing
%      singleton*.
%
%      H = TESTFIG returns the handle to a new TESTFIG or the handle to
%      the existing singleton*.
%
%      TESTFIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TESTFIG.M with the given input arguments.
%
%      TESTFIG('Property','Value',...) creates a new TESTFIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before testfig_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to testfig_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help testfig

% Last Modified by GUIDE v2.5 29-Jul-2019 22:28:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @testfig_OpeningFcn, ...
                   'gui_OutputFcn',  @testfig_OutputFcn, ...
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


% --- Executes just before testfig is made visible.
function testfig_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to testfig (see VARARGIN)

evalin('base',['clear all;']); %bersihin base workspace

% Choose default command line output for testfig
handles.output = hObject;
handles.counter = 0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes testfig wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = testfig_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;
evalin('base',['a = 0 ;']);
evalin('base',['mats = zeros(2500,3);']);
evalin('base',['startTime = tic;']);
sketch;


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton1.
function pushbutton1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.counter = handles.counter+1;
disp(handles.counter);
guidata(hObject,handles); %IMPORTANT: Harus ada ini supaya handles.counter ke-save.
evalin('base',[char(get(handles.edit1,'String')) 'mats(:,:,' num2str(handles.counter) ') = mats;']); %save mats

set(handles.axes1, 'XColor', [1 1 1]);
set(handles.axes1, 'YColor', [1 1 1]);

%save img
F = getframe(handles.axes1);
Image = frame2im(F);
currentFile = sprintf('%s%d.jpg',char(get(handles.edit1,'String')),handles.counter);
imwrite(Image, currentFile);

set(handles.axes1, 'XColor', [0.15 0.15 0.15]);
set(handles.axes1, 'YColor', [0.15 0.15 0.15]);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

evalin('base',['clear a mats startTime;']); %bersihin base workspace
cla; % clear axes


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.edit1,'enable','off');
set(handles.pushbutton4,'visible','off'); %remove edit & button


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)