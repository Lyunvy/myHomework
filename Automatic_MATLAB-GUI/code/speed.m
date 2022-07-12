function varargout = PD(varargin)
% PD MATLAB code for PD.fig
%      PD, by itself, creates a new PD or raises the existing
%      singleton*.
%
%      H = PD returns the handle to a new PD or the handle to
%      the existing singleton*.
%
%      PD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PD.M with the given input arguments.
%
%      PD('Property','Value',...) creates a new PD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PD_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PD_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PD

% Last Modified by GUIDE v2.5 10-Jul-2022 18:46:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PD_OpeningFcn, ...
                   'gui_OutputFcn',  @PD_OutputFcn, ...
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


% --- Executes just before PD is made visible.
function PD_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PD (see VARARGIN)

% Choose default command line output for PD
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
axes(handles.axes1);
imshow('speedmo.png');

a=str2double(get(handles.edit7,'String'));%Wn2
c=str2double(get(handles.edit9,'String'));
d=sqrt(a);%wn
num1=[a];
den1=[1,c,a];
t=[0:0.00001:3];
x=step(num1,den1,t);

xss=dcgain(num1,den1);
j=1;
while x(j)<max(x)
    j=j+1;
end
mp=(max(x)-xss)/xss;
tp=j/100000;
aa=1;
while x(aa)<xss
    aa=aa+1;
end
tr=aa/100000;
ti5=length(t);
while x(ti5)>0.95*xss&&x(ti5)<1.05*xss
    ti5=ti5-1;
end
ts5=ti5/100000;
ti2=length(t);
while x(ti2)>0.98*xss&&x(ti2)<1.02*xss
    ti2=ti2-1;
end
ts2=ti2/100000;
kx=c/(2*d);%kexi
set(handles.edit13,'String',kx);
set(handles.edit10,'String',mp);
set(handles.edit11,'String',tp);
set(handles.edit14,'String',tr);
set(handles.edit12,'String',ts5);
set(handles.edit15,'String',ts2);

mpex=str2double(get(handles.edit26,'String'));

syms kxex kh;
eq1=exp((-3.14*kxex)/sqrt(1-kxex^2))-mpex;
kxex=solve(eq1,kxex);
kxex=vpa(kxex);
kxex=roundn(double(kxex(kxex>0)),-4);
eq2=(c+a*kh)/(2*sqrt(a))-kxex;
kh=roundn(double(solve(eq2,kh)),-4);
set(handles.edit25,'String',kh);

c2=c+a*kh;
num2=[a];
den2=[1,c2,a];
y=step(num2,den2,t);
yss=dcgain(num2,den2);
j2=1;
while y(j2)<max(y)
    j2=j2+1;
end
mph=(max(y)-yss)/yss;
tph=j2/100000;
aa2=1;
while y(aa2)<yss
    aa2=aa2+1;
end
trh=aa2/100000;
ti25=length(t);
while y(ti25)>0.95*yss&&y(ti25)<1.05*yss
    ti25=ti25-1;
end
tsh5=ti25/100000;
ti22=length(t);
while y(ti22)>0.98*yss&&y(ti22)<1.02*yss
    ti22=ti22-1;
end
tsh2=ti22/100000;
kxh=(c+a*kh)/(2*sqrt(a));%kx kh
set(handles.edit22,'String',kxh);
set(handles.edit19,'String',mph);
set(handles.edit20,'String',tph);
set(handles.edit23,'String',trh);
set(handles.edit21,'String',tsh5);
set(handles.edit24,'String',tsh2);

axes(handles.axes2);
hold off;
plot(t,x,'k');
hold on;
plot(t,y,'r');
grid on;
hold on;
% UIWAIT makes PD wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PD_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2double(get(handles.edit7,'String'));%Wn2
c=str2double(get(handles.edit9,'String'));
d=sqrt(a);%wn
num1=[a];
den1=[1,c,a];
t=[0:0.00001:3];
x=step(num1,den1,t);

xss=dcgain(num1,den1);
j=1;
while x(j)<max(x)
    j=j+1;
end
mp=(max(x)-xss)/xss;
tp=j/100000;
aa=1;
while x(aa)<xss
    aa=aa+1;
end
tr=aa/100000;
ti5=length(t);
while x(ti5)>0.95*xss&&x(ti5)<1.05*xss
    ti5=ti5-1;
end
ts5=ti5/100000;
ti2=length(t);
while x(ti2)>0.98*xss&&x(ti2)<1.02*xss
    ti2=ti2-1;
end
ts2=ti2/100000;
kx=c/(2*d);%kexi
set(handles.edit13,'String',kx);
set(handles.edit10,'String',mp);
set(handles.edit11,'String',tp);
set(handles.edit14,'String',tr);
set(handles.edit12,'String',ts5);
set(handles.edit15,'String',ts2);

axes(handles.axes2);
hold off;
plot(t,x,'k');
grid on;
hold on;

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2double(get(handles.edit7,'String'));%Wn2
c=str2double(get(handles.edit9,'String'));
d=sqrt(a);%wn
num1=[a];
den1=[1,c,a];
t=[0:0.00001:3];
x=step(num1,den1,t);

xss=dcgain(num1,den1);
j=1;
while x(j)<max(x)
    j=j+1;
end
mp=(max(x)-xss)/xss;
tp=j/100000;
aa=1;
while x(aa)<xss
    aa=aa+1;
end
tr=aa/100000;
ti5=length(t);
while x(ti5)>0.95*xss&&x(ti5)<1.05*xss
    ti5=ti5-1;
end
ts5=ti5/100000;
ti2=length(t);
while x(ti2)>0.98*xss&&x(ti2)<1.02*xss
    ti2=ti2-1;
end
ts2=ti2/100000;
kx=c/(2*d);%kexi
set(handles.edit13,'String',kx);
set(handles.edit10,'String',mp);
set(handles.edit11,'String',tp);
set(handles.edit14,'String',tr);
set(handles.edit12,'String',ts5);
set(handles.edit15,'String',ts2);

mpex=str2double(get(handles.edit26,'String'));

syms kxex kh;
eq1=exp((-3.14*kxex)/sqrt(1-kxex^2))-mpex;
kxex=solve(eq1,kxex);
kxex=vpa(kxex);
kxex=roundn(double(kxex(kxex>0)),-4);
eq2=(c+a*kh)/(2*sqrt(a))-kxex;
kh=roundn(double(solve(eq2,kh)),-4);
set(handles.edit25,'String',kh);

c2=c+a*kh;
num2=[a];
den2=[1,c2,a];
y=step(num2,den2,t);
yss=dcgain(num2,den2);
j2=1;
while y(j2)<max(y)
    j2=j2+1;
end
mph=(max(y)-yss)/yss;
tph=j2/100000;
aa2=1;
while y(aa2)<yss
    aa2=aa2+1;
end
trh=aa2/100000;
ti25=length(t);
while y(ti25)>0.95*yss&&y(ti25)<1.05*yss
    ti25=ti25-1;
end
tsh5=ti25/100000;
ti22=length(t);
while y(ti22)>0.98*yss&&y(ti22)<1.02*yss
    ti22=ti22-1;
end
tsh2=ti22/100000;
kxh=(c+a*kh)/(2*sqrt(a));%kx kh
set(handles.edit22,'String',kxh);
set(handles.edit19,'String',mph);
set(handles.edit20,'String',tph);
set(handles.edit23,'String',trh);
set(handles.edit21,'String',tsh5);
set(handles.edit24,'String',tsh2);

axes(handles.axes2);
hold off;
plot(t,x,'k');
hold on;
plot(t,y,'r');
grid on;
hold on;


function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit23_Callback(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit23 as text
%        str2double(get(hObject,'String')) returns contents of edit23 as a double


% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit24_Callback(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit24 as text
%        str2double(get(hObject,'String')) returns contents of edit24 as a double


% --- Executes during object creation, after setting all properties.
function edit24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit25_Callback(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit25 as text
%        str2double(get(hObject,'String')) returns contents of edit25 as a double


% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function ben_Callback(hObject, eventdata, handles)
% hObject    handle to ben (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
ben;


% --------------------------------------------------------------------
function PD_Callback(hObject, eventdata, handles)
% hObject    handle to PD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
PD;


% --------------------------------------------------------------------
function speed_Callback(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
speed;


% --------------------------------------------------------------------
function about_Callback(hObject, eventdata, handles)
% hObject    handle to about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
about;


% --------------------------------------------------------------------
function logout_Callback(hObject, eventdata, handles)
% hObject    handle to logout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
login;



function edit26_Callback(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit26 as text
%        str2double(get(hObject,'String')) returns contents of edit26 as a double


% --- Executes during object creation, after setting all properties.
function edit26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2double(get(handles.edit7,'String'));%Wn2
c=str2double(get(handles.edit9,'String'));
d=sqrt(a);%wn
num1=[a];
den1=[1,c,a];
t=[0:0.00001:3];
x=step(num1,den1,t);

xss=dcgain(num1,den1);
j=1;
while x(j)<max(x)
    j=j+1;
end
mp=(max(x)-xss)/xss;
tp=j/100000;
aa=1;
while x(aa)<xss
    aa=aa+1;
end
tr=aa/100000;
ti5=length(t);
while x(ti5)>0.95*xss&&x(ti5)<1.05*xss
    ti5=ti5-1;
end
ts5=ti5/100000;
ti2=length(t);
while x(ti2)>0.98*xss&&x(ti2)<1.02*xss
    ti2=ti2-1;
end
ts2=ti2/100000;
kx=c/(2*d);%kexi
set(handles.edit13,'String',kx);
set(handles.edit10,'String',mp);
set(handles.edit11,'String',tp);
set(handles.edit14,'String',tr);
set(handles.edit12,'String',ts5);
set(handles.edit15,'String',ts2);

mpex=str2double(get(handles.edit26,'String'));

syms kxex kh;
eq1=exp((-3.14*kxex)/sqrt(1-kxex^2))-mpex;
kxex=solve(eq1,kxex);
kxex=vpa(kxex);
kxex=roundn(double(kxex(kxex>0)),-4);
eq2=(c+a*kh)/(2*sqrt(a))-kxex;
kh=roundn(double(solve(eq2,kh)),-4);
set(handles.edit25,'String',kh);

c2=c+a*kh;
num2=[a];
den2=[1,c2,a];
y=step(num2,den2,t);
yss=dcgain(num2,den2);
j2=1;
while y(j2)<max(y)
    j2=j2+1;
end
mph=(max(y)-yss)/yss;
tph=j2/100000;
aa2=1;
while y(aa2)<yss
    aa2=aa2+1;
end
trh=aa2/100000;
ti25=length(t);
while y(ti25)>0.95*yss&&y(ti25)<1.05*yss
    ti25=ti25-1;
end
tsh5=ti25/100000;
ti22=length(t);
while y(ti22)>0.98*yss&&y(ti22)<1.02*yss
    ti22=ti22-1;
end
tsh2=ti22/100000;
kxh=(c+a*kh)/(2*sqrt(a));%kx kh
set(handles.edit22,'String',kxh);
set(handles.edit19,'String',mph);
set(handles.edit20,'String',tph);
set(handles.edit23,'String',trh);
set(handles.edit21,'String',tsh5);
set(handles.edit24,'String',tsh2);

axes(handles.axes2);
hold off;
plot(t,x,'k');
hold on;
plot(t,y,'r');
grid on;
hold on;
