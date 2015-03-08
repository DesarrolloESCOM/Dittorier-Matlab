function varargout = grabadora(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @grabadora_OpeningFcn, ...
                   'gui_OutputFcn',  @grabadora_OutputFcn, ...
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


% --- Executes just before grabadora is made visible.
function grabadora_OpeningFcn(hObject, eventdata, handles, varargin)
a=imread('play.png'); 
set(handles.Play,'CData',a);
rec_img=imread('rec.png'); 
set(handles.Rec,'CData',rec_img);
c=imread('pause.png'); 
set(handles.StopRec,'CData',c);

% --- %
set(handles.playOtra,'CData',a);
set(handles.grabarOtra,'CData',rec_img);
set(handles.pausaOtra,'CData',c);
% Choose default command line output for grabadora
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes grabadora wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = grabadora_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



% --- Executes on button press in Rec.
function Rec_Callback(hObject, eventdata, handles)

global r 
r=audiorecorder;
record(r);

% --- Executes on button press in Play.
function Play_Callback(hObject, eventdata, handles)
% hObject    handle to Play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global voz Fs
%[voz Fs] =wavread('grabacion1');
sound(voz,Fs);
% Ts=1/Fs;
% tam=length(voz);
% t=(0:tam-1)*Ts;
% stem(handles.modificada,t,voz);
% title(handles.modificada,'Audio Modificado');
% xlabel(handles.modificada,'Tiempo (segundos)');
% ylabel(handles.modificada,'Amplitud');




% --- Executes on button press in StopRec.
function StopRec_Callback(hObject, eventdata, handles)
% hObject    handle to StopRec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r voz Fs t
stop(r);
voz=getaudiodata(r);
Fs=r.SampleRate;
Ts=1/Fs;
tam=length(voz);
t=(0:tam-1)*Ts;
plot(handles.original,t,voz);
title(handles.original,'Audio');
xlabel(handles.original,'Tiempo (segundos)');
ylabel(handles.original,'Amplitud');




% --- Executes on button press in habilitar.
function habilitar_Callback(hObject, eventdata, handles)
% hObject    handle to habilitar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bandera = get(hObject,'Value');
if bandera == 0
    set(handles.playOtra,'enable','off');
    set(handles.grabarOtra,'enable','off');
    set(handles.pausaOtra,'enable','off');
else 
    set(handles.playOtra,'enable','on');
    set(handles.grabarOtra,'enable','on');
    set(handles.pausaOtra,'enable','on');
end

% --- Executes on button press in grabarOtra.
function grabarOtra_Callback(hObject, eventdata, handles)
% hObject    handle to grabarOtra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global r 
r=audiorecorder;
record(r);

% --- Executes on button press in playOtra.
function playOtra_Callback(hObject, eventdata, handles)
% hObject    handle to playOtra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global otra Fs
%[voz Fs] =wavread('grabacion1');
sound(otra,Fs);

% --- Executes on button press in pausaOtra.
function pausaOtra_Callback(hObject, eventdata, handles)
% hObject    handle to pausaOtra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global r otra Fs t
stop(r);
otra=getaudiodata(r);
Fs=r.SampleRate;
Ts=1/Fs;
tam=length(otra);
t=(0:tam-1)*Ts;
plot(handles.otra,t,otra);
title(handles.otra,'Audio');
xlabel(handles.otra,'Tiempo (segundos)');
ylabel(handles.otra,'Amplitud');



% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes during object creation, after setting all properties.
function factor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
global voz Fs
opc=get(handles.popupmenu3,'Value');
f=get(handles.factor,'String');
factor=str2double(f);
Ts=1/Fs;
tam=length(voz);
t=(0:tam-1)*Ts;
switch opc
    case 1
        resultado=AmplificarAtenuar(voz,factor);
        stem(handles.modificada,t,resultado);
        title(handles.modificada,'Audio Modificado');
        xlabel(handles.modificada,'Tiempo (segundos)');
        ylabel(handles.modificada,'Amplitud');
        sound(resultado,Fs);

        
    case 2
        if(factor>0)
            resultado=voz(factor:+1:end);
            tam=length(resultado);
            t=(0:tam-1)*Ts;         
            stem(handles.modificada,t,resultado);
            title(handles.modificada,'Audio Modificado');
            xlabel(handles.modificada,'Tiempo (segundos)');
            ylabel(handles.modificada,'Amplitud');
            sound(resultado,Fs);
      

            
        else
            r=-factor;
            p=zeros(r,1);
            resultado=vertcat(p,voz);
            tam=length(resultado);
            t=(0:tam-1)*Ts;
            stem(handles.modificada,t,resultado);
            title(handles.modificada,'Audio Modificado');     
            xlabel(handles.modificada,'Tiempo (segundos)');
            ylabel(handles.modificada,'Amplitud');
            sound(resultado,Fs);
      
        end
        
    case 3
         resultado=Reflejo(voz);
         stem(handles.modificada,t,resultado);
         title(handles.modificada,'Audio Modificado');
        xlabel(handles.modificada,'Tiempo (segundos)');
        ylabel(handles.modificada,'Amplitud');
        sound(resultado,Fs);
      
    case 4
        
        tiem=tam/Fs;
        resultado=Diezmacion(voz,factor);
        t=downsample(t,factor);
        tam=length(resultado);
        stem(handles.modificada,t,resultado);
        title(handles.modificada,'Audio Modificado');
        xlabel(handles.modificada,'Tiempo (segundos)');
        ylabel(handles.modificada,'Amplitud');
        FsD=tam/tiem
        sound(resultado,FsD);
        
    case 5
        
        tiem=tam/Fs;
        resultado=Interpolacion(voz,factor);
        t=upsample(t,factor);
        tam=length(resultado);
        stem(handles.modificada,t,resultado);
        title(handles.modificada,'Audio Modificado');
        xlabel(handles.modificada,'Tiempo (segundos)');
        ylabel(handles.modificada,'Amplitud');
        FsD=tam/tiem
        sound(resultado,FsD);
        
end        


% --- Executes on button press in Convolucion.
function Convolucion_Callback(hObject, eventdata, handles)
% hObject    handle to Convolucion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r voz otra Fs t
funcion = get(handles.funcion,'String');
if isempty(funcion)
    convolucion = conv(voz, otra, 'full');
    Fs=r.SampleRate;
    Ts=1/Fs;
    tam = length(convolucion);
    t=(0:tam-1)*Ts;
    stem(handles.modificada,t,convolucion);
    title(handles.modificada,'Audio Convolucion');
    xlabel(handles.modificada,'Tiempo (segundos)');
    ylabel(handles.modificada,'Amplitud');
    tiem=tam/Fs;
    FsD=tam/tiem;
    sound(convolucion,FsD);
else
    x = linspace(0,100,1000);
    size(x)
    evaluada = eval(funcion);
    size(evaluada)
    plot(evaluada)
    title(handles.otra,'Audio Otra');
    xlabel(handles.otra,'Tiempo (ms)');
    ylabel(handles.otra,'Amplitud');
    %
    convolucion = conv(voz, evaluada, 'full');
    Fs=r.SampleRate;
    Ts=1/Fs;
    tam = length(convolucion);
    t=(0:tam-1)*Ts;
    stem(handles.modificada,t,convolucion);
    title(handles.modificada,'Audio Convolucion');
    xlabel(handles.modificada,'Tiempo (segundos)');
    ylabel(handles.modificada,'Amplitud');
    tiem=tam/Fs;
    FsD=tam/tiem;
    sound(convolucion,FsD);
end



function funcion_Callback(hObject, eventdata, handles)
% hObject    handle to funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of funcion as text
%        str2double(get(hObject,'String')) returns contents of funcion as a double


% --- Executes during object creation, after setting all properties.
function funcion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
