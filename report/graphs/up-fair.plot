set xlabel 'seconds'
set grid
set xrange [0:300.336953]
set yrange [0:100]
set offset graph 0.02
set key right top
set title '.'

set style line 1 lt 1 lc rgb "red"
set style line 2 lt 2 lc rgb "royalblue"
set style line 3 lt 3 lc rgb "orange-red"
set style line 4 lt 4 lc rgb "dark-blue"
set style line 5 lt 5 lc rgb "dark-orange"
set style line 6 lt 6 lc rgb "magenta"
set style line 7 lt 7 lc rgb "blue"
set style line 8 lt 8 lc rgb "dark-red"
set style line 9 lt 9 lc rgb "gray"
set style line 10 lt 10 lc rgb "forest-green"
set style line 11 lt 11 lc rgb "black"
set style line 12 lt 12 lc rgb "dark-magenta"
set style line 13 lt 13 lc rgb "dark-gray"

plot \
  '~/Dropbox/MPTCP/data/2013-07-18/ni-coupled-up-1/mptcp@11-up/wlp0s20u1.dat' using ($1-1374147730.035559):(80+$13/5) title 'fry utilization' with lines ls (1+5), \
  '~/Dropbox/MPTCP/data/2013-07-18/ni-coupled-up-1/mptcp@11-up/wlp0s20u1.dat' using ($1-1374147730.035559):(8*$15/1000000) title 'fry throughput' with lines ls (1+6),  \
  '~/Dropbox/MPTCP/data/2013-07-18/ni-coupled-up-1/mptcp@11-up/wlp0s20u4.dat' using ($1-1374147730.035559):(80+$13/5) title 'zoidberg utilization' with lines ls (2+5), \
  '~/Dropbox/MPTCP/data/2013-07-18/ni-coupled-up-1/mptcp@11-up/wlp0s20u4.dat' using ($1-1374147730.035559):(8*$15/1000000) title 'zoidberg throughput' with lines ls (2+6)
