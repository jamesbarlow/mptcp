set xlabel 'Throughput (Mbps)'
set ylabel 'CDF'
set grid
set xrange [0:30]
set yrange [0:100]
set key right bottom
set title 'CDF i-reno-simultaneous-2'

set style line 1 lt 1 lc rgb "red"
set style line 2 lt 2 lc rgb "royalblue"
set style line 3 lt 3 lc rgb "forest-green"
set style line 4 lt 4 lc rgb "dark-magenta"
set style line 5 lt 5 lc rgb "gray"
set style line 6 lt 6 lc rgb "black"

plot  \
  '~/Dropbox/MPTCP/data/2013-08-07/i-reno-simultaneous-2/mptcp-up/cdf-fry-1.dat' using (8*$1/1048576):($2*100) title 'Multipath network A' with lines ls (1), \
  '~/Dropbox/MPTCP/data/2013-08-07/i-reno-simultaneous-2/mptcp-up/cdf-zoidberg-2.dat' using (8*$1/1048576):($2*100) title 'Multipath network B' with lines ls (2), \
  '~/Dropbox/MPTCP/data/2013-08-07/i-reno-simultaneous-2/parallel-5a-up/cdf-fry-3.dat' using (8*$1/1048576):($2*100) title 'Parallel network A' with lines ls (3), \
  '~/Dropbox/MPTCP/data/2013-08-07/i-reno-simultaneous-2/parallel-5b-up/cdf-zoidberg-4.dat' using (8*$1/1048576):($2*100) title 'Parallel network B' with lines ls (4)
