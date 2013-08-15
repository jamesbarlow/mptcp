ap2if() {
  # dir ap
  cat "$1/iwconfig.log" 2>&1 | grep "ESSID:\"$2-wifi\"" | sed 's/^\([^ ]\+\) .*/\1/'
}

ap21if() {
  # dir ap
  ap2if "$1" "$2" | head -n1
}

if2ap() {
  # dir if
  cat "$1/iwconfig.log" | grep -E "^$2" | sed 's/^.*ESSID:"//' | sed 's/\(-wifi\)*".*//'
}

aps() {
  # dir
  cat "$1/iwconfig.log" | grep "ESSID:\"" | sed 's/^.*ESSID:"//' | sed 's/\(-wifi\)*".*//'
}

bpsf() {
  # bpsf filename
  isdown=$(echo "$1" | sed '/-down[\.\/]/!d' | wc -l)
  if (( isdown == 1 )); then
    # down
    if [[ $(basename "$1") == 'totals.dat' ]]; then
      echo 3
    else
      echo 16
    fi
  else
    # up
    if [[ $(basename "$1") == 'totals.dat' ]]; then
      echo 2
    else
      echo 15
    fi
  fi
}

suffix() {
  # dir up|down ap
  suffix=""
  for dir in "$1"/*parallel-*-$2; do
    if [[ $(grep "\"$3-wifi\"" "$dir/iwconfig.log" | wc -l) -eq 1 ]]; then
      echo "$dir" | sed "s/^.*-\\(.*\\)-$2$/\1/"
      return
    fi
  done
}

updown() {
  # set-dir
  isup=("$1"/*-up)
  if [[ -e "${isup[0]}" ]]; then
    echo up
  else
    echo down
  fi
}

isseq() {
  # set-dir
  # Detect if this is a simultaneous or sequential test set

  # Either the directory name tells us
  [[ $(realpath "$1") =~ simultaneous ]] && { echo 0; exit; }

  tests=$(ls -d "$1"/*-{up,down} 2>/dev/null | wc -l)

  # or the number of tests tells us
  ((tests != 3)) && { echo 1; exit; }

  # or the test start times tell us
  starts=0
  for t in "$1"/*-{up,down}; do
    [[ -e "$t" ]] || continue
    s=$(zcat "$t"/stats.log.gz | head -n 1 | cut -d'.' -f1)
    ((starts += s))
  done
  ((starts = starts/3))

  for t in "$1"/*-{up,down}; do
    [[ -e "$t" ]] || continue
    s=$(zcat "$t"/stats.log.gz | head -n 1 | cut -d'.' -f1)
    ((s-=starts))
    s="${s#-}" # absolute value

    # tests started more than 15 seconds apart, must be sequential
    ((s > 15)) && { echo 1; exit; }
  done

  echo 0
}

# vim:textwidth=0 syntax=sh:
