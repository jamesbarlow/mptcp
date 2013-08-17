set xlabel 'Throughput (Mbps)'
set ylabel 'CDF'
set grid
set xrange [0:30]
set yrange [0:100]
set key right bottom
set title 'CDF ni-reno-simultaneous-3'

set style line 1 lt 1 lc rgb "red"
set style line 2 lt 2 lc rgb "royalblue"
set style line 3 lt 3 lc rgb "forest-green"
set style line 4 lt 4 lc rgb "dark-magenta"
set style line 5 lt 5 lc rgb "gray"
set style line 6 lt 6 lc rgb "black"

plot  \
  '~/Dropbox/MPTCP/data/2013-08-06/ni-reno-simultaneous-3/mptcp-up/cdf-mptcp-up-fry-2.dat' using (8*$1/1048576):($2*100) title 'Channel 1 MPTCP' with lines ls (1), \
  '~/Dropbox/MPTCP/data/2013-08-06/ni-reno-simultaneous-3/mptcp-up/cdf-mptcp-up-zoidberg-1.dat' using (8*$1/1048576):($2*100) title 'Channel 2 MPTCP' with lines ls (2), \
  '~/Dropbox/MPTCP/data/2013-08-06/ni-reno-simultaneous-3/parallel-1-up/cdf-parallel-1-up-fry-4.dat' using (8*$1/1048576):($2*100) title 'Channel 1 Parallel' with lines ls (4), \
  '~/Dropbox/MPTCP/data/2013-08-06/ni-reno-simultaneous-3/parallel-11-up/cdf-parallel-11-up-zoidberg-3.dat' using (8*$1/1048576):($2*100) title 'Channel 2 Parallel' with lines ls (3)
