function sketch(cmd)
    if nargin == 0
        cmd = 'init';
    end
  switch cmd
  case 'init'
      fig = gcf;
      info.ax = gca; %masalah mungkin karena harus di .m yg sama
%       info.ax = axes(handles.axes1));
%       info.ax = axes(findobj('Tag','axes1'));
      axis([0 1 0 1]); %limit ukuran axis
%       info.ax = axes('XLim',[0 1],'YLim',[0 1]);
      info.drawing = [];
      info.x = [];
      info.y = [];
      set(fig,'UserData',info,...
              'WindowButtonDownFcn',[mfilename,' down'])
  case 'down'
      myname = mfilename;
      fig = gcbf;
      info = get(fig,'UserData');
      curpos = get(info.ax,'CurrentPoint');
      info.x = curpos(1,1);
      info.y = curpos(1,2);
      info.drawing = line(info.x,info.y,'Color','k');
      set(fig,'UserData',info,...
              'WindowButtonMotionFcn',[myname,' move'],...
              'WindowButtonUpFcn',[myname,' up'])
  case 'move'
      fig = gcbf;
      info = get(fig,'UserData');
      curpos = get(info.ax,'CurrentPoint');
      info.x = [info.x;curpos(1,1)];
      info.y = [info.y;curpos(1,2)];
      set(info.drawing,'XData',info.x,'YData',info.y)
%       b = b + 1;
%       matrix(b,1) = curpos(1,1);
%       matrix(b,2) = curpos(1,2);
      set(fig,'UserData',info)
      changelol(1);
  case 'up'
      fig = gcbf;
      changelol(2);
      set(fig,'WindowButtonMotionFcn','',...
              'WindowButtonUpFcn','')
  end
end