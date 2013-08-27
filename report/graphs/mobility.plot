
set xlabel 'seconds'
set grid
set xrange [-8.999008:308.965971]
set yrange [-5:105]
set key right center
set title 'mptcp-down'

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
  '~/Dropbox/MPTCP/data/2013-08-27/mobility/ni-coupled-down-10/mptcp-down/wlan1.dat' using ($1-1377609181.589148):(80+$14/5) title 'Utilization network A' with lines ls 1, \
  '~/Dropbox/MPTCP/data/2013-08-27/mobility/ni-coupled-down-10/mptcp-down/wlan1.dat' using ($1-1377609181.589148):(8*$16/1000000) title 'Throughput network A' with lines ls 3, \
  '~/Dropbox/MPTCP/data/2013-08-27/mobility/ni-coupled-down-10/mptcp-down/wlan5.dat' using ($1-1377609181.589148):(80+$14/5) title 'Utilization network B' with lines ls 2, \
  '~/Dropbox/MPTCP/data/2013-08-27/mobility/ni-coupled-down-10/mptcp-down/wlan5.dat' using ($1-1377609181.589148):(8*$16/1000000) title 'Throughput network B' with lines ls 4
