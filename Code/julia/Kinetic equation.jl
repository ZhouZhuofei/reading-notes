### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 17531dd8-5b19-11eb-2397-4b9685186e75
using DataFrames

# ╔═╡ 7b9a13a6-5b1a-11eb-270c-fbe23c0c7a16
using Plots

# ╔═╡ de23c9da-5b1b-11eb-1cec-5da7e292f8fa
using LaTeXStrings

# ╔═╡ e8fbf8a0-5b16-11eb-3c5f-2d5f223dd685
md"""
# Kinetic equation

动力学方程的数值解

For Example:

$-kx = m\frac{dv}{dt}$

if $k/m = 1$, Get:

$-x = \frac{dv}{dt}$

Init constant:when $t=0$, $x=1, v=0$.

get a $\varepsilon = 0.01s$, we can write:

$x(t+\varepsilon) = x(t) + \varepsilon * v(t)$

$v(t+\varepsilon) = v(t) + \varepsilon * a(t)$

we know:

$a(t) = \frac{dv}{dt} = -x(t)$

So:

$v(t+\varepsilon) = v(t) - \varepsilon * x(t)$

"""

# ╔═╡ 396eb94c-5b19-11eb-29e3-e7e0e6172cc8
ε = 0.1

# ╔═╡ 4b04cb86-5b19-11eb-25b3-a7f4e0ec641f
t = [0+i*ε for i = 0:80]

# ╔═╡ 821cfd2a-5b19-11eb-2ae2-8d47ead9fb78
begin
	x = fill(1.0, size(t))
	v = fill(0.0, size(t))
	a = fill(-1.0, size(t))
end

# ╔═╡ add3705e-5b19-11eb-13e5-47647119d71a
for i = 2:length(t)
	x[i] = x[i-1] + ε * v[i-1]
	v[i] = v[i-1] - ε * x[i-1]
	a[i] = -x[i]
end

# ╔═╡ 66a714bc-5b1a-11eb-1cc6-6b54078fb8c2
DataFrame(t=t, x=x, v=v, a=a)

# ╔═╡ d4722e14-5b1a-11eb-1c8d-457a3ec518f7
begin
	plot(title="the solution for the function",xlabel=L"t", ylabel=L"x(t)", leg=:outerright)
	plot!(t, cos.(t), label=L"cos(t)")
	scatter!(t, x, label="numerical")
	annotate!(1.5, 0.8, Plots.text(L"-x=\frac{dx}{dt}", :left))
end

# ╔═╡ e9dbf138-5b1d-11eb-17ef-53401c460ec7
begin
	p1 = plot(t, v, xlabel=L"t", ylabel=L"v(t)", leg=:none)
	p2 = plot(t, a, xlabel=L"t", ylabel=L"a(t)", leg=:none)
	plot(p1, p2)
end

# ╔═╡ 5fa11f62-5b1e-11eb-32ee-cde39aeeec14
md"""
the $\varepsilon$ value smaller, the more accurate.

set $\varepsilon=0.01$

set $\varepsilon=0.001$
"""

# ╔═╡ 520e74aa-5b1f-11eb-2452-a5ada1684fed
begin
	ε₁, ε₂, ε₃ = 0.1, 0.01, 0.001
	function Calculate_xva(n,b)
		t = [0+i*b for i=0:n]
		x = fill(1.0, size(t))
		v = fill(0.0, size(t))
		a = fill(-1.0, size(t))
		
		for i = 2:length(t)
			x[i] = x[i-1]+b * v[i-1] 
			v[i] = v[i-1]-b * x[i-1]
			a[i] = -x[i]
		end
		return DataFrame(t=t, x=x, v=v, a=a)
	end
end
	

# ╔═╡ 5db14c44-5b22-11eb-390b-119223780d10
begin
	Dt1 = Calculate_xva(80, ε₁)
	Dt2 = Calculate_xva(800, ε₂)
	Dt3 = Calculate_xva(8000, ε₃)
	Dt = [x[1:10:nrow(x),:] for x in [Dt2, Dt3]]
end

# ╔═╡ 25b206c0-5b23-11eb-375a-57357b03f36d
begin
	plot(title="the solution for the function",xlabel=L"t", ylabel=L"x(t)", leg=:outerright)
	scatter!(Dt1.t, Dt1.x, label=L"\varepsilon=0.1",alpha = 0.6)
	scatter!(Dt[1].t, Dt[1].x, label=L"\varepsilon = 0.01", alpha=0.5,shape=:o)
	plot!(Dt1.t, cos.(Dt1.t), label=L"cos(t)", c=:black, lw = 2)
end

# ╔═╡ 0942be16-5b24-11eb-272d-199939fda261
md"""
# Planetary motion

Sun point $(0, 0)$, Plane point $(x, y)$

$F = G\frac{Mm}{r^2}$

on X-axis:

$\frac{|F|_x}{x} = \frac{G\frac{Mm}{r^2}}{r}$

$m\frac{dv_x}{dt} = -\frac{GMmx}{r^3}$

on Y-axis:

$\frac{|F|_y}{y} = \frac{G\frac{Mm}{r^2}}{r}$

$m\frac{dv_y}{dt} = -\frac{GMmy}{r^3}$

assume $GM=1$:

$\frac{dv_x}{dt} = -\frac{x}{r^3}$
$\frac{dv_y}{dt} = -\frac{y}{r^3}$

if $t = 0, x(t=0) = 0.5, y(t=0) = 0.0, v_x(t=0) = 0.0, v_y(t=0) = 1.630$

we can calculate:

"""

# ╔═╡ 4ea82282-5bb2-11eb-25e8-6d141e50d983
δ = 0.01

# ╔═╡ 637486b0-5bb2-11eb-1237-afa69bfe6489
plane_time = [0+i*δ for i = 0:450]

# ╔═╡ 75e49bbe-5bb2-11eb-2f1f-b92d30e09c12
begin
	plane_x = fill(0.5, size(plane_time))
	plane_y = fill(0.0, size(plane_time))
	plane_vx = fill(0.0, size(plane_time))
	plane_vy = fill(1.63, size(plane_time))
	plane_r = fill(0.5, size(plane_time))
end

# ╔═╡ caf14d96-5bb2-11eb-1bd8-e3aaecd0a90e
for i = 2:length(plane_time)
	plane_x[i] = plane_x[i-1] + δ * plane_vx[i-1]
	plane_y[i] = plane_y[i-1] + δ * plane_vy[i-1]
	plane_vx[i] = plane_vx[i-1] - δ * plane_x[i-1]/plane_r[i-1]^3
	plane_vy[i] = plane_vy[i-1] - δ * plane_y[i-1]/plane_r[i-1]^3
	plane_r[i] = sqrt(plane_x[i]^2 + plane_y[i]^2)
end

# ╔═╡ 64646206-5bb3-11eb-0a37-25e54342937f
begin
	plot(plane_x, plane_y, leg=:none, xlabel=L"x", ylabel=L"y",framestyle=:origin)
	scatter!([0.0], [0.0],marker = (10, 1.0, :red))
	scatter!(plane_x[1:50:500], plane_y[1:50:500])
	#quiver!(plane_x[1:10:500], plane_y[1:10:500], quiver=(-0.5 * plane_x[1:10:500], -0.5 * plane_y[1:10:500]))
	quiver!([plane_x[50]], [plane_y[50]], quiver=([-plane_x[50]], [-plane_y[50]]), c=:black)
	quiver!([plane_x[50]], [plane_y[50]], quiver=([-plane_x[50]], [0.0]), c=:black)
	quiver!([plane_x[50]], [plane_y[50]], quiver=([0.0], [-plane_y[50]]), c=:black)
	annotate!(0.0, 0.25, text(L"F", :black,15))
	annotate!(0.0, -0.1, text("sun", :red, 17))
	annotate!(plane_x[50]+0.1, plane_y[50]+0.1, text("plane", 10))
	annotate!(plane_x[50]+0.1, plane_y[50]/2, text(L"F_y", :black, 10))
	annotate!(-0.05, plane_y[50]+0.05, text(L"F_x", :black, 10))
	
	
	#plot!([plane_x[50], 0.0], [plane_y[50],0.0], line=:arrow, lw=2, c=:black)
end

# ╔═╡ Cell order:
# ╟─e8fbf8a0-5b16-11eb-3c5f-2d5f223dd685
# ╠═17531dd8-5b19-11eb-2397-4b9685186e75
# ╠═7b9a13a6-5b1a-11eb-270c-fbe23c0c7a16
# ╠═de23c9da-5b1b-11eb-1cec-5da7e292f8fa
# ╠═396eb94c-5b19-11eb-29e3-e7e0e6172cc8
# ╠═4b04cb86-5b19-11eb-25b3-a7f4e0ec641f
# ╠═821cfd2a-5b19-11eb-2ae2-8d47ead9fb78
# ╠═add3705e-5b19-11eb-13e5-47647119d71a
# ╟─66a714bc-5b1a-11eb-1cc6-6b54078fb8c2
# ╠═d4722e14-5b1a-11eb-1c8d-457a3ec518f7
# ╠═e9dbf138-5b1d-11eb-17ef-53401c460ec7
# ╟─5fa11f62-5b1e-11eb-32ee-cde39aeeec14
# ╠═520e74aa-5b1f-11eb-2452-a5ada1684fed
# ╠═5db14c44-5b22-11eb-390b-119223780d10
# ╠═25b206c0-5b23-11eb-375a-57357b03f36d
# ╟─0942be16-5b24-11eb-272d-199939fda261
# ╠═4ea82282-5bb2-11eb-25e8-6d141e50d983
# ╠═637486b0-5bb2-11eb-1237-afa69bfe6489
# ╠═75e49bbe-5bb2-11eb-2f1f-b92d30e09c12
# ╠═caf14d96-5bb2-11eb-1bd8-e3aaecd0a90e
# ╠═64646206-5bb3-11eb-0a37-25e54342937f
