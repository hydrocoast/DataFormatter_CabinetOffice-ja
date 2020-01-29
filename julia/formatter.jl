"""
arraydata = formatter(filename::String, nx::Int, ny::Int; HeaderLines::Int=0)
### Arguments
- filename : file path and file name
- nx, ny   : number of x- and y- grids
### Keyword argument
- HeaderLines : number of header lines. Default is zero (no header).
### Return value
- arraydata: mesh data formatted from fixed length array
"""
function formatter(filename::String, nx::Int, ny::Int; HeaderLines::Int=0)
    txt = readlines(filename)
    arraydata = [parse(Float64, txt[i+HeaderLines][8(j-1)+1:8j]) for i=1:length(txt), j=1:10]
    arraydata = permutedims(arraydata, [2,1])
    arraydata = reshape(vec(arraydata), (nx, ny))
    arraydata = reverse(permutedims(arraydata, [2,1]), dims=1)
    return arraydata
end
