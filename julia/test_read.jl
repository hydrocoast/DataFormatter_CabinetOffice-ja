include("formatter.jl")

# filename
datapath = "../depth/system08"
filename = "depth_2430-01.dat"
nx = 720
ny = 540

# load
arraydata = formatter(joinpath(datapath, filename), nx, ny)

# Figure
dx = 2430.0
dy = dx
x = collect(Float64, -1.2000e6+0.5dx:dx:0.5496e6-0.5dx)
y = collect(Float64, -1.2060e6+0.5dy:dy:0.1062e6-0.5dy)

using Plots
gr()
plt = plot(x, y, -arraydata, linetype=:heatmap, c=:delta, clims=(-5000, 5000))
plt = plot!(plt, x, y, -arraydata, linetype=:contour, levels=[0], lc=:black)


#=
# Print
using Printf
open( "matrix_depth_2430-01.csv", "w" ) do fileIO
    [(if j != nx
          @printf(fileIO, "%11.3e,", -arraydata[i,j])
      else
          @printf(fileIO, "%11.3e\n", -arraydata[i,j])
      end) for j=1:nx, i=1:ny]
end
=#
