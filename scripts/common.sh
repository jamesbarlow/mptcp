function ap2if() {
  # dir ap
  cat "$1/iwconfig.log" 2>&1 | grep "ESSID:\"$2-wifi\"" | sed 's/^\([^ ]\+\) .*/\1/'
}

function ap21if() {
  # dir ap
  ap2if "$1" "$2" | head -n1
}

function if2ap() {
  # dir if
  cat "$1/iwconfig.log" | grep -E "^$2" | sed 's/^.*ESSID:"//' | sed 's/\(-wifi\)*".*//'
}

function aps() {
  # dir
  cat "$1/iwconfig.log" | grep "ESSID:\"" | sed 's/^.*ESSID:"//' | sed 's/\(-wifi\)*".*//'
}

function bpsf() {
  # bpsf filename
  isdown=`echo "$1" | sed '/-down[\.\/]/!d' | wc -l`
  if [[ $isdown -eq 1 ]]; then
    # down
    if [[ `basename "$1"` == 'totals.dat' ]]; then
      echo 3
    else
      echo 16
    fi
  else
    # up
    if [[ `basename "$1"` == 'totals.dat' ]]; then
      echo 2
    else
      echo 15
    fi
  fi
}

function suffix() {
  # dir up|down ap
  suffix=""
  for dir in `ls -d "$1"/*single-*-$2`; do
    if [[ `grep "\"$3-wifi\"" "$dir/iwconfig.log" | wc -l` -eq 1 ]]; then
      echo "$dir" | sed "s/^.*-\\(.*\\)-$2$/\1/"
      return
    fi
  done
}


# vim:textwidth=0 syntax=sh:
