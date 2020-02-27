function [sig,fs] = splay2(action,param,param2)

%  splay2: ELE 201 Signal Viewer and Audio Player
%          (now with frequency content)

if ((nargin == 0) | ((nargin == 1) & ~isstr(action)))

  callauto = ['ud = get(gcbf,''userdata'');',...
              '[ud.sig,ud.fs] = splay2(''auto'',get(gcbo,''value''),gcbf);',...
              'if size(ud.sig,2) == 1,ud.sig = ud.sig'';end,',... 
              'ud.dft = fft(ud.sig);',...
              'ud.ldft = length(ud.dft);',...
              'ud.lowind = round(ud.low/ud.fs*ud.ldft);',...
              'ud.highind = round(ud.high/ud.fs*ud.ldft);',...
              'set(gcbf,''userdata'',ud);',...
              'splay2(''refresh'',gcbf);'];
  callws = ['ud = get(gcbf,''userdata'');',...
            'var = get(gcbo,''string'');',...
             'evalin(''base'',[''ud.sig = '',var,''+0;'']);',...
             'if size(ud.sig,2) == 1,ud.sig = ud.sig'';end,',... 
             'ud.dft = fft(ud.sig);',...
             'ud.ldft = length(ud.dft);',...
             'set(ud.lowbox,''string'',num2str(round(ud.fs/6)));',...
             'set(ud.highbox,''string'',num2str(round(ud.fs/3)));',...
             'set(gcbf,''userdata'',ud);',...
             'splay2(''refresh'',gcbf);'];
  callfs = ['ud = get(gcbf,''userdata'');',...
            'ud.fs = str2num(get(gcbo,''string''));',...
            'set(ud.lowbox,''string'',num2str(round(ud.fs/6)));',...
            'set(ud.highbox,''string'',num2str(round(ud.fs/3)));',...
            'set(gcbf,''userdata'',ud);',...
            'splay2(''refresh'',gcbf);'];
  calltows1 = ['ud = get(gcbf,''userdata'');',...
               'if isfield(ud,''p1''),',...
               'evalin(''base'',[get(gcbo,''string''),''=get(ud.p1,''''ydata'''');'']);end'];
  calltows2 = ['ud = get(gcbf,''userdata'');',...
               'if isfield(ud,''p2''),',...
               'evalin(''base'',[get(gcbo,''string''),''=get(ud.p2,''''ydata'''');'']);end'];
  calltows3 = ['ud = get(gcbf,''userdata'');',...
               'if isfield(ud,''p3''),',...
               'evalin(''base'',[get(gcbo,''string''),''=get(ud.p3,''''ydata'''');'']);end'];


  if (nargin == 0)
    ud.sig = [];
  else
    ud.sig = action;
  end

  ud.fs = 10000;

  ud.low = round(ud.fs/6);
  ud.high = round(ud.fs/3);

  ud.dft = fft(ud.sig);

  ud.ldft = length(ud.dft);
  ud.lowind = ud.low/ud.fs*ud.ldft;
  ud.highind = ud.high/ud.fs*ud.ldft;

  h0 = figure('Color',[0.8 0.8 0.8], ...
	'MenuBar','none', ...
	'Name','ELE 201 Signal Viewer and Audio Player: Mark II', ...
	'NumberTitle','off', ...
	'Position',[200 200 588 472], ...
	'Tag','Fig1');
  h1 = axes('Parent',h0, ...
	'Units','pixels', ...
	'CameraUpVector',[0 1 0], ...
	'CameraUpVectorMode','manual', ...
	'Color',[1 1 1], ...
	'Position',[26 255 367 190], ...
	'Tag','Axes1', ...
	'XColor',[0 0 0], ...
	'YColor',[0 0 0], ...
	'ZColor',[0 0 0]);

  ud.tax = h1;

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
	'Position',[-0.07923497267759562 0.492063492063492 9.160254037844386], ...
	'Rotation',90, ...
	'Tag','Axes1Text3', ...
	'VerticalAlignment','baseline');
  set(get(h2,'Parent'),'YLabel',h2);
  h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','right', ...
	'Position',[-0.07103825136612021 1.142857142857143 9.160254037844386], ...
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
	'Callback',callfs, ...
	'ListboxTop',0, ...
	'Position',[495.75 275.25 60 25], ...
	'Style','edit', ...
	'Tag','EditText1');

  ud.fsbox = h1;

  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'ListboxTop',0, ...
	'Position',[432.75 273.25 58 28.75], ...
	'String',{'Sampling' 'Frequency'}, ...
	'Style','text', ...
	'Tag','StaticText1');
  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'Callback','ud = get(gcbf,''userdata'');if ~isempty(ud.sig),sound(ud.sig,ud.fs);end', ...
	'ListboxTop',0, ...
	'Position',[440.5 310.75 120.75 29.5], ...
	'String','Play as sound', ...
	'Tag','Pushbutton1');

  ud.autos = str2mat(' Dial Tone',' Busy Signal',' Phone Ring',...
         ' Bird Chirp',' Egg Drop',' Train Whistle',' I Wish 1',' I Wish 2');


  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'Callback',callauto, ...
	'ListboxTop',0, ...
	'Position',[430 400.75 110.75 24], ...
	'String',ud.autos,...
	'Style','popupmenu', ...
	'Tag','PopupMenu1', ...
	'Value',1);
  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'ListboxTop',0, ...
	'Position',[430.25 430.75 79.5 15], ...
	'String','Built-in signals', ...
	'Style','text', ...
	'Tag','StaticText2');
  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'Callback',callws, ...
	'ListboxTop',0, ...
	'Position',[480.25 358.5 60 25], ...
	'Style','edit', ...
	'Tag','EditText2');
  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'ListboxTop',0, ...
	'Position',[420.75 355.75  58 28.75], ...
	'String','Workspace Variable', ...
	'Style','text', ...
	'Tag','StaticText3');
  h1 = axes('Parent',h0, ...
	'Units','pixels', ...
	'CameraUpVector',[0 1 0], ...
	'CameraUpVectorMode','manual', ...
	'Color',[1 1 1], ...
	'Position',[27 32 367 190], ...
	'Tag','Axes1', ...
	'XColor',[0 0 0], ...
	'YColor',[0 0 0], ...
	'ZColor',[0 0 0]);

  ud.fax = h1;

  h2 = text('Parent',h1, ...
	'ButtonDownFcn','ctlpanel SelectMoveResize', ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Interruptible','off', ...
	'Position',[0.4972677595628415 -0.1216931216931214 9.160254037844386], ...
	'Tag','Axes1Text4', ...
	'VerticalAlignment','cap');
  set(get(h2,'Parent'),'XLabel',h2);
  h2 = text('Parent',h1, ...
	'ButtonDownFcn','ctlpanel SelectMoveResize', ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Interruptible','off', ...
	'Position',[-0.07923497267759562 0.4920634920634921 9.160254037844386], ...
	'Rotation',90, ...
	'Tag','Axes1Text3', ...
	'VerticalAlignment','baseline');
  set(get(h2,'Parent'),'YLabel',h2);
  h2 = text('Parent',h1, ...
	'ButtonDownFcn','ctlpanel SelectMoveResize', ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','right', ...
	'Interruptible','off', ...
	'Position',[-0.07377049180327869 2.322751322751323 9.160254037844386], ...
	'Tag','Axes1Text2', ...
	'Visible','off');
  set(get(h2,'Parent'),'ZLabel',h2);
  h2 = text('Parent',h1, ...
	'ButtonDownFcn','ctlpanel SelectMoveResize', ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Interruptible','off', ...
	'Position',[0.4972677595628415 1.031746031746032 9.160254037844386], ...
	'Tag','Axes1Text1', ...
	'VerticalAlignment','bottom');
  set(get(h2,'Parent'),'Title',h2);
  h1 = uicontrol('Parent',h0, ...
        'Callback','ud = get(gcbf,''userdata'');if isfield(ud,''p1''),sound(get(ud.p1,''ydata''),ud.fs);end', ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[400.5 138 80 22.5], ...
	'String','Play Low-Pass', ...
	'Tag','Pushbutton2');
  h1 = uicontrol('Parent',h0, ...
        'Callback','ud = get(gcbf,''userdata'');if isfield(ud,''p2''),sound(get(ud.p2,''ydata''),ud.fs);end', ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[400.5 110.25 80 22.5], ...
	'String','Play Mid-Pass', ...
	'Tag','Pushbutton2');
  h1 = uicontrol('Parent',h0, ...
        'Callback','ud = get(gcbf,''userdata'');if isfield(ud,''p3''),sound(get(ud.p3,''ydata''),ud.fs);end', ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[400.5 82.5 80 22.5], ...
	'String','Play High-Pass', ...
	'Tag','Pushbutton2');
  h1 = uicontrol('Parent',h0, ...
        'Callback',calltows1,...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[517.5 138 60 22.5], ...
	'Style','edit', ...
	'Tag','EditText3');
  h1 = uicontrol('Parent',h0, ...
        'Callback',calltows2,...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[517.5 109 60 22.5], ...
	'Style','edit', ...
	'Tag','EditText3');
  h1 = uicontrol('Parent',h0, ...
        'Callback',calltows3,...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[517.5 80 60 22.5], ...
	'Style','edit', ...
	'Tag','EditText3');
  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'ListboxTop',0, ...
	'Position',[480.875 144 30.75 10.5], ...
	'String','------->', ...
	'Style','text', ...
	'Tag','StaticText4');
  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'ListboxTop',0, ...
	'Position',[480.875 116.25 30.75 10.5], ...
	'String','------->', ...
	'Style','text', ...
	'Tag','StaticText4');
  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'ListboxTop',0, ...
	'Position',[480.5 88.5 30.75 10.5], ...
	'String','------->', ...
	'Style','text', ...
	'Tag','StaticText4');
  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'ListboxTop',0, ...
	'Position',[480.5 162.75 101.5 13.5], ...
	'String','To Workspace', ...
	'Style','text', ...
	'Tag','StaticText5');
  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'ListboxTop',0, ...
	'Position',[425.5 45 50 22.5], ...
	'String',{'Low-Pass' 'Threshold'}, ...
	'Style','text', ...
	'Tag','StaticText6');
  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'ListboxTop',0, ...
	'Position',[425.5 18 50 22.5], ...
	'String',{'High-Pass' 'Threshold'}, ...
	'Style','text', ...
	'Tag','StaticText6');
  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
        'Callback','splay2(''refresh'',gcbf);',...
	'ListboxTop',0, ...
	'Position',[500.875 45 60 25], ...
        'String',num2str(ud.low),...
	'Style','edit', ...
	'Tag','EditText4');

  ud.lowbox = h1;

  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
        'Callback','splay2(''refresh'',gcbf);',...
	'ListboxTop',0, ...
	'Position',[500.875 18 60 25], ...
        'String',num2str(ud.high),...
	'Style','edit', ...
	'Tag','EditText4');

  ud.highbox = h1;

  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
        'Callback','splay2(''redisplay'',gcbf);',...
	'ListboxTop',0, ...
	'Position',[415.25 250.875 45.25 15.75], ...
	'String','Low', ...
	'Style','checkbox', ...
	'Tag','Checkbox1');

  ud.lowcheck = h1;

  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
        'Callback','splay2(''redisplay'',gcbf);',...
	'ListboxTop',0, ...
	'Position',[465.5 250 45.25 15.75], ...
	'String','Mid', ...
	'Style','checkbox', ...
	'Tag','Checkbox1');

  ud.midcheck = h1;

  h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
        'Callback','splay2(''redisplay'',gcbf);',...
	'ListboxTop',0, ...
	'Position',[515.75 250 45.25 15.75], ...
	'String','High', ...
	'Style','checkbox', ...
	'Tag','Checkbox1');

  ud.highcheck = h1;

  set(h0,'userdata',ud);

  if (nargin == 1)
    splay2('refresh');
  end

  sig = [];
  fs = [];

elseif strcmp(action,'refresh')

  ud = get(param,'userdata');

  ud.low = max(round(str2num(get(ud.lowbox,'string'))),0);
  ud.high = min(round(str2num(get(ud.highbox,'string'))),ud.fs/2);

  if ud.low > ud.high
    t = ud.low;
    ud.low = ud.high;
    ud.high = t;
  end

  set(ud.lowbox,'string',num2str(ud.low));
  set(ud.highbox,'string',num2str(ud.high));

  ud.lowind = round(ud.low/ud.fs*ud.ldft);
  ud.highind = round(ud.high/ud.fs*ud.ldft);

  axes(ud.tax);
  cla
  hold on
  plot(ud.sig);

  ud.p1 = plot(real(ifft(ud.dft.*[ones(1,ud.lowind) zeros(1,ud.ldft-2*ud.lowind) ones(1,ud.lowind)])),'r','visible','off');
  ud.p2 = plot(real(ifft(ud.dft.*[zeros(1,ud.lowind) ones(1,ud.highind-ud.lowind) zeros(1,ud.ldft-2*ud.highind) ones(1,ud.highind-ud.lowind) zeros(1,ud.lowind) ])),'g','visible','off');
  ud.p3 = plot(real(ifft(ud.dft.*[zeros(1,ud.highind) ones(1,ud.ldft-2*ud.highind) zeros(1,ud.highind)])),'m','visible','off');

  hold off

  set(param,'userdata',ud);

  splay2('redisplay',param);

  axes(ud.fax);
  cla
  hold on
  plot([1:ud.lowind]/ud.ldft*ud.fs,abs(ud.dft(1:ud.lowind)),'r');
  plot([(ud.lowind+1):ud.highind]/ud.ldft*ud.fs,abs(ud.dft((ud.lowind+1):ud.highind)),'g');
  plot([(ud.highind+1):ud.ldft/2]/ud.ldft*ud.fs,abs(ud.dft((ud.highind+1):ud.ldft/2)),'m');
  axis tight
  plot([ud.lowind ud.lowind]/ud.ldft*ud.fs,get(gca,'ylim'),'k:')
  plot([ud.highind ud.highind]/ud.ldft*ud.fs,get(gca,'ylim'),'k:')
  hold off
  zoom on

  set(ud.fsbox,'string',num2str(ud.fs));

elseif strcmp(action,'redisplay')

  ud = get(param,'userdata');

  if (get(ud.lowcheck,'value') == 1)
     set(ud.p1,'visible','on');
  else
     set(ud.p1,'visible','off');
  end
  if (get(ud.midcheck,'value') == 1)
     set(ud.p2,'visible','on');
  else
     set(ud.p2,'visible','off');
  end
  if (get(ud.highcheck,'value') == 1)
     set(ud.p3,'visible','on');
  else
     set(ud.p3,'visible','off');
  end

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


