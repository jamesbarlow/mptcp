set xlabel 'Throughput (Mbps)'
set ylabel 'CDF'
set grid
set xrange [0:30]
set yrange [0:100]
set key right bottom
set title 'CDF 5-coupled-down-4'

set style line 1 lt 1 lc rgb "red"
set style line 2 lt 2 lc rgb "royalblue"
set style line 3 lt 3 lc rgb "forest-green"
set style line 4 lt 4 lc rgb "dark-magenta"
set style line 5 lt 5 lc rgb "black"
set style line 6 lt 6 lc rgb "gray"

plot  \
    '~/Dropbox/MPTCP/data/2013-08-14/5-coupled-down-4/mptcp-down/cdf-bender-1.dat' using (8*$1/1048576):($2*100) title 'Channel 1 MPTCP' with lines ls (1), \
    '~/Dropbox/MPTCP/data/2013-08-14/5-coupled-down-4/mptcp-down/cdf-zoidberg-2.dat' using (8*$1/1048576):($2*100) title 'Channel 2 MPTCH' with lines ls (2), \
    '~/Dropbox/MPTCP/data/2013-08-14/5-coupled-down-4/parallel-1-down/cdf-zoidberg-3.dat' using (8*$1/1048576):($2*100) title 'Channel 1 Parallel' with lines ls (3), \
    '~/Dropbox/MPTCP/data/2013-08-14/5-coupled-down-4/parallel-5-down/cdf-bender-4.dat' using (8*$1/1048576):($2*100) title 'Channel 2 Parallel' with lines ls (4), \
    '~/Dropbox/MPTCP/data/2013-08-14/5-coupled-down-4/mptcp-down/cdf-mptcp-total-5.dat' using (8*$1/1048576):($2*100) title 'Aggregate MPTCP' with lines ls 6
