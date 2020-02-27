function [sig,fs] = splay(action,param,param2)

if ((nargin == 0) | ((nargin == 1) & ~isstr(action)))

  callauto = ['ud = get(gcbf,''userdata'');',...
              '[ud.sig,ud.fs] = splay(''auto'',get(gcbo,''value''),gcbf);',...
              'set(gcbf,''userdata'',ud);',...
              'splay(''refresh'',gcbf);'];
  callws = 'ud = get(gcbf,''userdata'');var = get(gcbo,''string'');evalin(''base'',[''ud.sig = '',var,''+0;'']);set(gcbf,''userdata'',ud);splay(''refresh'',gcbf);';
  callwav  = '[file,path] = uigetfile(''*.wav'',''Select a .wav file'');if file ~= 0,ud = get(gcbf,''userdata'');err = 0;eval(''[sig,fs] = audioread([path,file]);'',''err=1;'');if err == 0,ud.sig = sig;ud.fs = fs;clear sig fs,set(gcbf,''userdata'',ud);splay(''refresh'',gcbf);end,end';

  if (nargin == 0)
    ud.sig = [];
  else
    ud.sig = action;
  end

  ud.fs = 10000;
	
  h0 = figure('Color',[0.8 0.8 0.8], ...
        'MenuBar','none', ...
	'Position',[463 702 560 244], ...
	'Tag','Fig1', ...
        'Numbertitle','off', ...
        'Name','ELE 201 Signal Viewer and Audio Player');
  h1 = axes('Parent',h0, ...
	'Units','pixels', ...
	'CameraUpVector',[0 1 0], ...
	'Color',[1 1 1], ...
	'Position',[25 34 367 190], ...
	'Tag','Axes1', ...
	'XColor',[0 0 0], ...
	'YColor',[0 0 0], ...
	'ZColor',[0 0 0]);

  ud.ax = h1;

  h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[0.4973   -0.1217    9.1603], ...
	'Tag','Axes1Text4', ...
	'VerticalAlignment','cap');
  set(get(h2,'Parent'),'XLabel',h2);
  h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[-0.07923497267759563 0.4920634920634921 9.160254037844386], ...
	'Rotation',90, ...
	'Tag','Axes1Text3', ...
	'VerticalAlignment','baseline');
  set(get(h2,'Parent'),'YLabel',h2);
  h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','right', ...
	'Position',[-0.06830601092896176 1.105820105820106 9.160254037844386], ...
	'Tag','Axes1Text2', ...
	'Visible','off');
  set(get(h2,'Parent'),'ZLabel',h2);
  h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[0.4973    1.0317    9.1603], ...
	'Tag','Axes1Text1', ...
	'VerticalAlignment','bottom');
  set(get(h2,'Parent'),'Title',h2);
  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'Callback','ud = get(gcbf,''userdata'');ud.fs = str2num(get(gcbo,''string''));set(gcbf,''userdata'',ud);', ...
	'ListboxTop',0, ...
	'Position',[475 24.75 60 25], ...
	'Style','edit', ...
	'Tag','EditText1');

  ud.fsbox = h1;

  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'ListboxTop',0, ...
	'Position',[420 21.75 58 28.75], ...
	'String','Sampling Frequency', ...
	'Style','text', ...
	'Tag','StaticText1');
  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'Callback','ud = get(gcbf,''userdata'');if ~isempty(ud.sig),sound(ud.sig,ud.fs);end', ...
	'ListboxTop',0, ...
	'Position',[415 50.25 82.75 28.5], ...
	'String','Play as sound', ...
	'Tag','Pushbutton1');

  ud.autos = str2mat(' I Feel Good', ...
         ' Respect',' Bird Chirp',' Egg Drop',' Train Whistle');

  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'Callback',callauto, ...
	'ListboxTop',0, ...
	'Position',[415 149 115.75 24], ...
	'String',ud.autos, ...
	'Style','popupmenu', ...
	'Tag','PopupMenu1', ...
	'Value',1);
  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'ListboxTop',0, ...
	'Position',[415 176.75 79.5 15], ...
	'String','Built-in signals', ...
	'Style','text', ...
	'Tag','StaticText2');
  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'Callback',callws, ...
	'ListboxTop',0, ...
	'Position',[475 117.75 60 25], ...
	'Style','edit', ...
	'Tag','EditText2');
  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'ListboxTop',0, ...
	'Position',[415 117 55.5 22.5], ...
	'String','Workspace Variable', ...
	'Style','text', ...
	'Tag','StaticText3');
  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'Callback',callwav, ...
	'ListboxTop',0, ...
	'Position',[415 86.25 120 29.25], ...
	'String','Load from .wav file...', ...
	'Tag','Pushbutton2');

  set(h0,'userdata',ud);

  if (nargin == 1)
    splay('refresh');
  end

  sig = [];
  fs = [];

elseif strcmp(action,'refresh')

  ud = get(param,'userdata');
  axes(ud.ax);
  plot(ud.sig);
  set(ud.fsbox,'string',num2str(ud.fs));

elseif strcmp(action,'auto');

  ud = get(param2,'userdata');

  Fs = 8192;
  file = ud.autos(param,:);
  file(file == ' ') = [];      % get rid of extra blanks in filename
  [sig,fs] = audioread(strcat(file,'.wav'));
  ud.sig = sig/max(abs(sig));
  ud.fs = fs;

  set(param2,'userdata',ud);

end  


