function printESRI(X,Y,DEP,dx,filename)

[my, mx] = size(DEP);

% % topotype 3
fmt = [repmat('%17.9e ',[1 mx]),'\n'];
fid = fopen(filename,'w');
fprintf(fid,'%d     mx\n',mx);
fprintf(fid,'%d     my\n',my);
fprintf(fid,'%f     xlower\n',min(X(:)));
fprintf(fid,'%f     ylower\n',min(Y(:)));
% fprintf(fid,'%f     cellsize\n',dx);
fprintf(fid,'%e     cellsize\n',dx);
fprintf(fid,'%d     nodatavalue\n',-9999);
fprintf(fid,fmt,flipud(-DEP)');
fclose(fid);


end