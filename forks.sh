ps --no-headers auxwwwm | awk '$2 == "-" { print $1 }' | sort | uniq -c | sort -n
