clear
close all

% % setup
region_str = '08';
resolution_str = {'2430','0810','0270','0090','0030','0010'};

% % xls
xlspath = '../計算範囲設定';
xlsname = ['計算範囲設定_第',region_str,'系.xls'];
% % file
datapath = ['../地形データ_第',region_str,'系'];

% % directory
if ~exist(['zone',region_str],'dir'); mkdir(['zone',region_str]); end

for i = 1:length(resolution_str)
% for i = 1:1
    T = readtable(fullfile(xlspath, xlsname), 'Sheet', [resolution_str{i},'m'], 'Range','B5','ReadVariableNames', false);
    
    flist = dir([datapath,'/depth_',resolution_str{i},'-*.dat']);

    for j = 1:length(flist)
        filename = fullfile(flist(j).folder,flist(j).name);

        % % formatter
        arraydata = formatter(fullfile(flist(j).folder,flist(j).name), ...
                              T.Var9(j), T.Var10(j));
        
        dx = T.Var2(j);
        dy = dx;
        
        x = T.Var3(j)+0.5*dx:dx:T.Var5(j)-0.5*dx;
        y = T.Var4(j)+0.5*dy:dy:T.Var6(j)-0.5*dy;
        [X,Y] = meshgrid(x,y);
        
        % % print data as a file in ESRI format
        printESRI(x, y, arraydata, dx, strrep(flist(j).name,'dat','asc'))
        movefile(strrep(flist(j).name,'dat','asc'), ['zone',region_str,'/'])
       
        % % fig
        figure(gcf); clf;
        pcolor(X,Y,-arraydata); shading interp;
        axis equal tight
        demcmap([0.8*min(min(-arraydata)) 0.8*max(max(-arraydata))]);
        cb = colorbar;
        title(strrep(flist(j).name,'_','\_'),'FontWeight','normal')
        % % savefig
        print(gcf, strrep(flist(j).name,'.dat','.png'), '-dpng', '-r300');
        movefile(strrep(flist(j).name,'.dat','.png'), ['zone',region_str,'/'])
    end
end
