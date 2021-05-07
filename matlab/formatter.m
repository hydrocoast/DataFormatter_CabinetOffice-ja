function arraydata = formatter(varargin)
% arraydata = formatter(filename, nx, ny, HeaderLines)
% input args
%   filename    : file path
%   nx, ny      : number of x- and y- grids
%   HeaderLines : number of header lines
%  
narginchk(3,5)

filename = varargin{1};
nx = varargin{2};
ny = varargin{3};

if nargin < 4
    HL = 0;
else
    HL = varargin{4};
end
if nargin < 5
    fmt = '%8.2f';
else
    fmt = varargin{5};
end

fid = fopen(filename,'r');
org = textscan(fid,fmt,'HeaderLines',HL);
fclose(fid);
org = cell2mat(org);

arraydata = flipud(permute(reshape(org,[nx,ny]),[2,1]));

end
