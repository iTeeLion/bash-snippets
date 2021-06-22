#!/bin/bash

function do_export () {
    echo "Export from iptables to file"
    iptables-save -f /etc/iptables/rules.v4
    ip6tables-save -f /etc/iptables/rules.v6
}

function do_import () {
    echo "Import from file to iptables"
    iptables-restore /etc/iptables/rules.v4
    ip6tables-restore /etc/iptables/rules.v6
}

function do_clear () {
    echo "Clearing iptables"
    iptables -P INPUT ACCEPT
    iptables -P OUTPUT ACCEPT
    iptables –-flush
    ip6tables -P INPUT ACCEPT
    ip6tables -P OUTPUT ACCEPT
    ip6tables –-flush
}

function do_install () {
    echo "Installing iptables import/export packages"
    apt install iptables-persistent
}

function main_menu () {
    echo "Select action:"
    echo "1. Export iptables"
    echo "2. Import iptables"
    echo "3. Clear iptables"
    echo "9. Install iptables import/export packages"
    read ACTION
    case "$ACTION" in
        1)
            do_export
        ;;
        2)
            do_import
        ;;
        3)
            do_clear
        ;;
        9)
            do_install
        ;;
        *)
            main_menu
        ;;
    esac
}

main_menu
