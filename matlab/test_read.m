clear
close all


% file
datapath = '../depth/system08';
filename = 'depth_2430-01.dat';
% parameters
nx = 720;
ny = 540;
% formatter
arraydata = formatter(fullfile(datapath,filename),nx,ny);


% % Figure
dx = 2430;
dy = dx;
x = -1.2000e6:dx:0.5496e6-dx;
y = -1.2060e6:dy:0.1062e6-dy;
[X,Y] = meshgrid(x,y);

% plot
pcolor(X,Y,-arraydata); shading interp;
axis equal tight
demcmap([-7000 3000])
cb = colorbar;


% % % output
fileout = 'matrix_depth_2430-01.csv';
fmt = ['%14.6e',repmat(',%14.6e',[1, nx-1]),'\n'];
% % print
fid = fopen(fileout,'w');
fprintf(fid,fmt,-arraydata');
fclose(fid);

