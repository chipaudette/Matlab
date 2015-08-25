function h = weaText(varargin);
%function h = weaText(string,position);

%parse inputs
string = varargin{1};
position = varargin{2};
if length(varargin) > 2
    varargin = {varargin{3:end}};
end

%remove any trailing empty cells
if iscell(string)
    for I=length(string):-1:1
        if ~isempty(string{I})
            break;
        end
    end
    string = {string{1:I}}';
end

%xl=xlim;
%yl=ylim;
[x,y]=getposition(position);
switch position
    case 1
        %x = xl(2)-0.025*diff(xl);
        %y = yl(2)-0.04*diff(yl);
        h = text(x,y,string,'horizontalAlignment','right','verticalalignment','top');
    case 2
        %x = xl(1)+0.025*diff(xl);
        %y = yl(2)-0.04*diff(yl);
        h = text(x,y,string,'horizontalAlignment','left','verticalalignment','top');
     case 3
        %x = xl(1)+0.025*diff(xl);
        %y = yl(1)+0.04*diff(yl);
        h = text(x,y,string,'horizontalAlignment','left','verticalalignment','bottom');       
     case 4
        %x = xl(2)-0.025*diff(xl);
        %y = yl(1)+0.04*diff(yl);
        h = text(x,y,string,'horizontalAlignment','right','verticalalignment','bottom');  
end

%%%%%%%%%%%%%%%%%%%%%%%%
function [x,y]=getposition(position)

if strcmpi(get(gca,'Xscale'),'log');
    x = getXpositionLog(position);
else
    x = getXpositionLinear(position);
end
if strcmpi(get(gca,'Yscale'),'log');
    y = getYpositionLog(position);
else
    y = getYpositionLinear(position);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function x = getXpositionLog(position)
xl=xlim;
fac = 0.025;
switch position
    case 1
        x = xl(1)*10^((1-fac)*log10(xl(2)/xl(1)));
    case 2
        x = xl(1)*10^((fac)*log10(xl(2)/xl(1)));
    case 3
        x = xl(1)*10^((fac)*log10(xl(2)/xl(1)));    
    case 4
        x = xl(1)*10^((1-fac)*log10(xl(2)/xl(1)));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function x = getXpositionLinear(position)
xl=xlim;
fac = 0.025;
switch position
    case 1
        x = xl(2)-fac*diff(xl);
    case 2
        x = xl(1)+fac*diff(xl);
     case 3
        x = xl(1)+fac*diff(xl);     
     case 4
        x = xl(2)-fac*diff(xl);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = getYpositionLog(position)
yl=ylim;
fac = 0.04;
switch position
    case 1
        y = yl(1)*10^((1-fac)*log10(yl(2)/yl(1)));
    case 2
        y = yl(1)*10^((1-fac)*log10(yl(2)/yl(1)));
    case 3
        y = yl(1)*10^((fac)*log10(yl(2)/yl(1)));    
    case 4
        y = yl(1)*10^((fac)*log10(yl(2)/yl(1)));  
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = getYpositionLinear(position)
yl=ylim;
fac = 0.04;
switch position
    case 1
        y = yl(2)-fac*diff(yl);
    case 2
        y = yl(2)-fac*diff(yl);
     case 3
        y = yl(1)+fac*diff(yl);     
     case 4
         y = yl(1)+fac*diff(yl);   
end


