#!/usr/bin/gnuplot

### tics
set xtics 0.2
set ytics 0.2
set y2tics 0.4

### range
set yrange [0:1.8]
set y2range [0:3.6]

### format
set tics font "Arial,12"
set format x "%10.1f"
set format y "%10.1f"
set format y2 "%10.1f"

### label
set xlabel font "Times New Roman:Italic,15"
set ylabel font "Times New Roman,15"
set y2label font "Times New Roman,15"
set xlabel "r"
set ylabel "Angular  velocity  of  Particle"
set y2tics nomi
set y2label "Fluid  vorticity"

set size ratio 1 
set palette rgb 33,13,10

set key right outside
#unset key

set grid linewidth 1 linecolor "black"

### output
set terminal postscript eps color
set output 'out/r_wz.eps'

### vorticity
  plot "vorticity_diagonal_Re50Wi0.01.dat" u (sqrt($1*$1+$2*$2)):($5) axis x1y2 w l dt 2 lw 2 lc rgb "red" ti "Fluid  Wi = 0.01" 
replot "vorticity_diagonal_Re50Wi1.00.dat" u (sqrt($1*$1+$2*$2)):($5) axis x1y2 w l dt 2 lw 2 lc rgb "blue" ti "Fluid  Wi = 1.00" 
replot "vorticity_diagonal_Re50Wi5.00.dat" u (sqrt($1*$1+$2*$2)):($5) axis x1y2 w l dt 2 lw 2 lc rgb "black" ti "Fluid  Wi = 5.00" 

### angular velocity
replot "angularvelocity_Diagonal_Re50Wi0.01.dat" u (sqrt($1*$1+$2*$2)):($5) axis x1y1 w lp lc rgb "red" ti "Angular  Wi = 0.01"
#replot "angularvelocity_Diagonal_Re50Wi0.05.dat" u (sqrt($1*$1+$2*$2)):($5) w lp lc rgb "blue" ti "Particle  Wi = 0.05"
#replot "angularvelocity_Diagonal_Re50Wi0.10.dat" u (sqrt($1*$1+$2*$2)):($5) w lp  lc rgb "blue" ti "Angular  Wi = 0.10"
replot "angularvelocity_Diagonal_Re50Wi0.25.dat" u (sqrt($1*$1+$2*$2)):($5) axis x1y1 w lp lc rgb "blue" ti "Angular  Wi = 0.25"
replot "angularvelocity_Diagonal_Re50Wi0.50.dat" u (sqrt($1*$1+$2*$2)):($5) axis x1y1 w lp lc rgb "black" ti "Angular  Wi = 0.50"
replot

pause -1
