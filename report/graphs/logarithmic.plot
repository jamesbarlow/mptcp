
set ylabel 'kilobytes/10'
set y2label 'Mbit/s'
set xlabel 'seconds'
set grid
set xrange [-18.017094:618.586906]
set yrange [-5:105]
set key right top
set title 'parallel-5a-up'

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
  '~/Dropbox/MPTCP/data/2013-08-07/i-coupled-simultaneous-4/parallel-5a-up/wlan0.dat' using ($1-1375884725.788495):(1428*$12/1024/10) title 'Congestion window' with lines ls 4, \
  '~/Dropbox/MPTCP/data/2013-08-07/i-coupled-simultaneous-4/parallel-5a-up/wlan0.dat' using ($1-1375884725.788495):($9/1024/10) title 'Send queue' with lines ls 3, \
  '~/Dropbox/MPTCP/data/2013-08-07/i-coupled-simultaneous-4/parallel-5a-up/wlan0.dat' using ($1-1375884725.788495):(8*$15/1000000) title 'Throughput' with lines ls 2
