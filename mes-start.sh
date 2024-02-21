#!/bin/bash

mes-start() {
    echo -e ""
    echo -e "\e[1;32m[MES] Starting MES-AUTOMATION in 5 seconds...\e[0m"
    sleep 1
    for i in {4..1}; do
        echo -e ""
        echo -e "\e[1;33m[MES-START] $i\e[0m"
        sleep 1
    done
    
    echo -e ""
    echo -e "\e[1;32m[MES] MES-AUTOMATION application is already to start!\e[0m"
    sleep 2
    echo -e ""
    echo -e "\e[1;34m[MES-SERVICE] Starting MES-backend service with name 'mes-back'\e[0m"
    screen -S mes-back -dm bash -c 'cd backend && python3 app.py'

    sleep 5

    if ! screen -list | grep -q "mes-back"; then
        echo -e ""
        echo -e "\e[1;31mError: MES-backend failed to start\e[0m"
        exit 1
    fi

    echo -e ""
    echo -e "\e[1;34m[MES-SERVICE] Starting MES-frontend service with name 'mes-front'\e[0m"
    screen -S mes-front -dm bash -c 'cd frontend && yarn serve'

    sleep 5

    if ! screen -list | grep -q "mes-front"; then
        echo -e ""
        echo -e "\e[1;31mError: MES-frontend failed to start\e[0m"
        exit 1
    fi

    echo -e ""
    echo -e "\e[1;32m[MES] MES-AUTOMATION is ready to use!\e[0m"
    echo -e ""
}

mes-start

