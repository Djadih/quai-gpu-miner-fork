#!/bin/bash

# Check if the miner_num environment variable is set
if [[ -z "$1" ]]; then
    echo "Please set the miner_num environment variable."
    exit 1
fi

# Create a single session if it doesn't exist
SESSION="miner_session"
tmux has-session -t $SESSION 2>/dev/null
if [ $? != 0 ]; then
    tmux new-session -d -s $SESSION
fi

miner_path="/home/user/quai-gpu-miner/build/kawpowminer/kawpowminer"

# Function to run the miner with log
run_miner() {
    local region="$1"
    local zone="$2"
    local cmd="$miner_path --noeval -U -P stratum://$3:$4"
    local window_name="miner_${region}_${zone}"
    
    # Create a new window and run the command
    tmux new-window -t $SESSION -n "$window_name" "$cmd"
    sleep 5
}

if [[ "$1" == "0" ]]; then
    run_miner 0 0 34.136.175.169 30000

elif [[ "$1" == "1" ]]; then
    run_miner 0 1 34.122.101.50 30000

elif [[ "$1" == "2" ]]; then
    run_miner 0 1 34.23.101.139 30000

elif [[ "$1" == "3" ]]; then
    run_miner 0 1 104.154.20.180 30000

elif [[ "$1" == "4" ]]; then
    run_miner 0 1 104.154.61.2 30000

elif [[ "$1" == "5" ]]; then
    run_miner 0 1 35.184.104.136 30000

elif [[ "$1" == "6" ]]; then
    run_miner 0 1 35.231.110.209 30000

elif [[ "$1" == "7" ]]; then
    run_miner 0 1 34.148.95.85 30000

elif [[ "$1" == "8" ]]; then
    run_miner 0 1 35.196.18.46 30000

elif [[ "$1" == "9" ]]; then
    run_miner 0 1 34.150.195.234 30000

elif [[ "$1" == "10" ]]; then
    run_miner 0 1 34.48.26.43 30000

elif [[ "$1" == "11" ]]; then
    run_miner 0 1 34.86.208.48 30000

elif [[ "$1" == "12" ]]; then
    run_miner 0 1 34.127.0.107 30000

elif [[ "$1" == "13" ]]; then
    run_miner 0 1 35.233.196.99 30000

elif [[ "$1" == "14" ]]; then
    run_miner 0 1 34.83.96.190 30000

elif [[ "$1" == "15" ]]; then
    run_miner 0 1 35.235.127.37 30000

elif [[ "$1" == "16" ]]; then
    run_miner 0 1 34.94.153.104 30000

elif [[ "$1" == "17" ]]; then
    run_miner 0 1 34.94.62.186 30000

elif [[ "$1" == "18" ]]; then
    run_miner 0 1 34.106.123.42 30000

elif [[ "$1" == "19" ]]; then
    run_miner 0 1 34.106.170.28 30000

elif [[ "$1" == "20" ]]; then
    run_miner 0 1 34.106.236.217 30000

elif [[ "$1" == "21" ]]; then
    run_miner 0 1 34.42.196.134 30000

elif [[ "$1" == "22" ]]; then
    run_miner 0 1 34.136.27.12 30000

elif [[ "$1" == "23" ]]; then
    run_miner 0 1 34.133.149.157 30000

elif [[ "$1" == "24" ]]; then
    run_miner 0 1 35.185.46.66 30000

elif [[ "$1" == "25" ]]; then
    run_miner 0 1 34.138.120.183 30000

elif [[ "$1" == "26" ]]; then
    run_miner 0 1 34.148.244.236 30000

elif [[ "$1" == "27" ]]; then
    run_miner 0 1 35.197.42.190 30000

elif [[ "$1" == "28" ]]; then
    run_miner 0 1 34.145.82.5 30000

elif [[ "$1" == "29" ]]; then
    run_miner 0 1 34.168.211.78 30000
fi

else
    echo "Invalid miner_num value"
fi
