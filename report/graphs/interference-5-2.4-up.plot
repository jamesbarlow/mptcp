set xlabel 'Throughput (Mbps)'
set ylabel 'CDF'
set grid
set xrange [-1:31]
set yrange [-5:105]
set key center right
set title 'CDF 5-coupled-1'

set style line 1 lt 1 lc rgb "red"
set style line 2 lt 2 lc rgb "royalblue"
set style line 3 lt 3 lc rgb "forest-green"
set style line 4 lt 4 lc rgb "dark-magenta"
set style line 5 lt 5 lc rgb "gray"
set style line 6 lt 6 lc rgb "black"

plot  \
  '~/Dropbox/MPTCP/data/2013-07-22/5-coupled-1/parallel-5-up/cdf-bender-1.dat' using (8*$1/1048576):($2*100) title 'Parallel 5 GHz' with lines ls (1), \
  '~/Dropbox/MPTCP/data/2013-07-22/5-coupled-1/parallel-2.4-up/cdf-zoidberg-2.dat' using (8*$1/1048576):($2*100) title 'Parallel 2.4 GHz' with lines ls (3), \
  '~/Dropbox/MPTCP/data/2013-07-22/5-coupled-1/single-5-up/cdf-bender-3.dat' using (8*$1/1048576):($2*100) title 'Single 5 GHz' with lines ls (2), \
  '~/Dropbox/MPTCP/data/2013-07-22/5-coupled-1/single-2.4-up/cdf-zoidberg-4.dat' using (8*$1/1048576):($2*100) title 'Single 2.4 GHz' with lines ls (4)
