#!/bin/bash

mes-stop() {
    echo -e ""
    echo -e "\e[1;34m[MES] Stopping all MES-AUTOMATION services...\e[0m"
    screen -ls | grep "mes-" | cut -d. -f1 | awk '{print $1}' | xargs -I {} screen -X -S {} quit
    sleep 1
    echo -e "\e[1;32m[MES] All MES-AUTOMATION screens have been stopped\e[0m"
    echo -e ""
}

mes-stop
