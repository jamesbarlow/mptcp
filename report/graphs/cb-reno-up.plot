set xlabel 'Throughput (Mbps)'
set ylabel 'CDF'
set grid
set xrange [0:30]
set yrange [0:100]
set key top left
set title 'CDF 5-reno'

set style line 1 lt 1 lc rgb "red"
set style line 2 lt 2 lc rgb "royalblue"
set style line 3 lt 3 lc rgb "forest-green"
set style line 4 lt 4 lc rgb "dark-magenta"
set style line 5 lt 5 lc rgb "gray"
set style line 6 lt 6 lc rgb "black"

plot  \
  '~/Dropbox/MPTCP/data/2013-08-05/5-reno/mptcp@2.4-up/cdf-fry-1.dat' using (8*$1/1048576):($2*100) title 'MPTCP 2.4 GHz' with lines ls (1), \
  '~/Dropbox/MPTCP/data/2013-08-05/5-reno/mptcp@5-up/cdf-bender-2.dat' using (8*$1/1048576):($2*100) title 'MPTCP 5 GHz' with lines ls (2), \
  '~/Dropbox/MPTCP/data/2013-08-05/5-reno/parallel-2.4-up/cdf-fry-3.dat' using (8*$1/1048576):($2*100) title 'Parallel 2.4 GHz' with lines ls (3), \
  '~/Dropbox/MPTCP/data/2013-08-05/5-reno/parallel-5-up/cdf-bender-4.dat' using (8*$1/1048576):($2*100) title 'Parallel 5 GHz' with lines ls (4)
