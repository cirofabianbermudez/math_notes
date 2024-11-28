##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## [Filename]       plot.gp
## [Project]        -
## [Author]         Ciro Bermudez - cirofabian.bermudezmarquez@ba.infn.it
## [Language]       gnuplot
## [Created]        Nov 2024
## [Modified]       -
## [Description]    
## [Notes]          
## [Status]         -
## [Revisions]      -
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## global variables
filename = "plot"
select = 1

## change the terminal from the command line
if (ARGC > 0) {
    select = ARG1 + 0
}

if (select == 1) {
# PNG Version
  print "PNG Mode Selected"
  reset
  unit = 3
  set terminal pngcairo size unit*640, unit*384 font "CMU Serif, 10" fontscale 1*unit*0.95
  set output filename . ".png"
}

if (select == 2) {
# PDF Version
  print "PDF Mode Selected"
  reset
  unit = 2.5
  set terminal pdfcairo size unit*5in, unit*3in font "CMU Serif, 10" fontscale 0.5*unit 
  set output filename . ".pdf"
}


## plot configuration
set title "Title" 
set xlabel "t"
set ylabel "f(t)"
legend = "f(t) = sin(t)" 


xleft = -10; xright = 10; xstep = 2
ydown = -10; yup = 10; ystep = 2

set xrange [xleft:xright]
set yrange [ydown:yup]

set xtics xleft,xstep,xright 
set ytics ydown,ystep,yup
set tics format "%.1f"


set border 1+2+4+8

set key top right box

grid_major = 100
grid_minor = 101

set style line grid_major dashtype 1 linecolor rgb "#E0E0E0"
set style line grid_minor dashtype 3 linecolor rgb "#C7C7C7"

if (select == 3){
  set style line grid_minor dashtype 3 linecolor rgb "#C7C7C7" linewidth 0.35
}

set grid
set mxtics 5; set mytics 5; 
set grid mxtics mytics linestyle grid_major, lines grid_minor
set tics scale 1,1e-3

graph_style = 102
set style line graph_style linecolor rgb "#0000ff"\
                                     linewidth 1 \
                                     dashtype  1 \
                                     pointsize 1 \
                                     pointtype 4 \

set samples 100
set dummy x
a = 1; w = 1
f(x) = exp(x)
g(x) = x**2
h(x) = 2*x
plot f(x) title legend with linespoints linestyle graph_style, \
     g(x) title legend with linespoints linestyle graph_style, \
     h(x) title legend with linespoints linestyle graph_style

# Restore default values
reset
set terminal qt
set output

