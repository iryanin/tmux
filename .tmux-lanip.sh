all_nics=$(ifconfig 2>/dev/null | awk -F':' '/^[a-z]/ && !/^lo/ { print $1 }' | tr '\n' ' ')
IFS=' ' read -ra all_nics_array <<< "$all_nics"
for nic in "${all_nics_array[@]}"; do
    ipv4s_on_nic=$(ifconfig ${nic} 2>/dev/null | awk '$1 == "inet" { print $2 }')
    for lan_ip in ${ipv4s_on_nic[@]}; do
        [[ -n "${lan_ip}" ]] && break
    done
    [[ -n "${lan_ip}" ]] && break
done

printf "LAN:${lan_ip-N/a}"
