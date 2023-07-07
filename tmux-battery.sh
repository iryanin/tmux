echo "$(pmset -g batt |  grep 'InternalBattery'|sed -E 's/[^\)]*\)\t([0-9]+%).*/\1/')"
