clear
close all

% % setup
region_str = '06';

% % xls
xlspath = '../計算範囲設定';
xlsname = ['計算範囲設定_第',region_str,'系.xls'];
T = readtable(fullfile(xlspath, xlsname), 'Sheet', '2430m', 'Range','B5','ReadVariableNames', false);
dx = T.Var2/3;
dy = T.Var2/3;
nx = T.Var9*3;
ny = T.Var10*3;
x = T.Var3:dx:T.Var5-dx;
y = T.Var4:dy:T.Var6-dy;
[X,Y] = meshgrid(x,y);

% % file
datapath = ['../deform/地形データ_第',region_str,'系'];

% % directory
if ~exist(['deform_zone',region_str],'dir'); mkdir(['deform_zone',region_str]); end



cmap = colormap(jet(20)); close
cmap(10,:) = [.8,.8,.8];
cmap(11,:) = [.8,.8,.8];

% for i = 1:11
for i = 1:1
    
    flist = dir(fullfile(datapath,['津波断層ケース',num2str(i,'%02d')],'deform_*.dat'));

    for j = 1:length(flist)
        filename = fullfile(flist(j).folder,flist(j).name);

        % % formatter
        arraydata = formatter(fullfile(flist(j).folder,flist(j).name), nx, ny, 0, '%8.4f');        
        
        % % print data as a file in ESRI format
        printESRI(x, y, arraydata, dx, strrep(flist(j).name,'dat','asc'))
        movefile(strrep(flist(j).name,'dat','asc'), ['deform_zone',region_str,'/'])
       
        % % fig
        figure(gcf); clf;
        pcolor(X,Y,arraydata); shading interp;
        axis tight equal
        caxis([-0.5,0.5]);
        colormap(cmap)
        cb = colorbar;
        title(strrep(flist(j).name,'_','\_'),'FontWeight','normal')
        % % savefig
        print(gcf, strrep(flist(j).name,'.dat','.png'), '-dpng', '-r300');
        movefile(strrep(flist(j).name,'.dat','.png'), ['deform_zone',region_str,'/'])
    end
end
