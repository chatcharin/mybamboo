I = imread('conner.jpg');
   [ny,nx] = size(I);
var2fix = 'dX_default';

fixvariable;

var2fix = 'dY_default';

fixvariable;

var2fix = 'map';

fixvariable;
n_ima =1;
if ~exist('n_ima'),
    data_calib;
end;



if (exist('map')~=1), map = gray(256); end;


if exist('dX'),
    dX_default = dX;
end;

if exist('dY'),
    dY_default = dY;
end;

if exist('n_sq_x'),
    n_sq_x_default = n_sq_x;
end;

if exist('n_sq_y'),
    n_sq_y_default = n_sq_y;
end;


if ~exist('dX_default')|~exist('dY_default');
    
    % Setup of JY - 3D calibration rig at Intel (new at Intel) - use units in mm to match Zhang
    dX_default = 30;
    dY_default = 30;
    
    % Setup of JY - 3D calibration rig at Google - use units in mm to match Zhang
    dX_default = 100;
    dY_default = 100;
    
end;


if ~exist('n_sq_x_default')|~exist('n_sq_y_default'),
    n_sq_x_default = 10;
    n_sq_y_default = 10;
end;

if ~exist('wintx_default')|~exist('winty_default'),
    wintx_default = max(round(nx/128),round(ny/96));
    winty_default = wintx_default;
    clear wintx winty
end;


if ~exist('wintx') | ~exist('winty'),
    clear_windows; % Clear all the window sizes (to re-initiate)
end;



if ~exist('dont_ask'),
    dont_ask = 0;
end;


if ~dont_ask,
    ima_numbers = input('Number(s) of image(s) to process ([] = all images) = ');
else
    ima_numbers = [];
end;

if isempty(ima_numbers),
    ima_proc = 1:n_ima;
else
    ima_proc = ima_numbers;
end;


% Useful option to add images:
kk_first = ima_proc(1); %input('Start image number ([]=1=first): ');


if exist(['wintx_' num2str(kk_first)]),
    
    eval(['wintxkk = wintx_' num2str(kk_first) ';']);
    
    if isempty(wintxkk) | isnan(wintxkk),
        
        disp('Window size for corner finder (wintx and winty):');
        wintx = input(['wintx ([] = ' num2str(wintx_default) ') = ']);
        if isempty(wintx), wintx = wintx_default; end;
        wintx = round(wintx);
        winty = input(['winty ([] = ' num2str(winty_default) ') = ']);
        if isempty(winty), winty = winty_default; end;
        winty = round(winty);
        
        fprintf(1,'Window size = %dx%d\n',2*wintx+1,2*winty+1);
        
    end;
    
else
    
    disp('Window size for corner finder (wintx and winty):');
    wintx = input(['wintx ([] = ' num2str(wintx_default) ') = ']);
    if isempty(wintx), wintx = wintx_default; end;
    wintx = round(wintx);
    winty = input(['winty ([] = ' num2str(winty_default) ') = ']);
    if isempty(winty), winty = winty_default; end;
    winty = round(winty);
    fprintf(1,'Window size = %dx%d\n',2*wintx+1,2*winty+1);
    
end;
figure(2);
image(I);
map = gray(256);
colormap(map);
set(2,'color',[1 1 1]);

x= [];y = [];
figure(2); hold on;
for count = 1:4,
    [xi,yi] = ginput4(1);
    [xxi] = cornerfinder([xi;yi],I,winty,wintx);
    xi = xxi(1);
    yi = xxi(2);
    figure(2);
    plot(xi,yi,'+','color',[ 1.000 0.314 0.510 ],'linewidth',2);
    plot(xi + [wintx+.5 -(wintx+.5) -(wintx+.5) wintx+.5 wintx+.5],yi + [winty+.5 winty+.5 -(winty+.5) -(winty+.5)  winty+.5],'-','color',[ 1.000 0.314 0.510 ],'linewidth',2);
    x = [x;xi];
    y = [y;yi];
    plot(x,y,'-','color',[ 1.000 0.314 0.510 ],'linewidth',2);
    drawnow;
end;
plot([x;x(1)],[y;y(1)],'-','color',[ 1.000 0.314 0.510 ],'linewidth',2);
drawnow;
hold off;