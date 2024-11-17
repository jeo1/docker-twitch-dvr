#!/bin/bash

quality=480p

echo root_path = "\"/VODs\"" > /twitch-stream-recorder/config.py
echo username = "\"$username\"" >> /twitch-stream-recorder/config.py
echo client_id = "\"$client_id\"" >> /twitch-stream-recorder/config.py
echo client_secret = "\"$client_secret\"" >> /twitch-stream-recorder/config.py

IFS=',' read -r -a array <<< "$username"

for user in "${array[@]}"
do
    tmux new-session -d -s $user "python3 /twitch-stream-recorder/twitch-recorder.py -q $quality -u $user"
done

#tmux new-session -d -s $username "python3 /twitch-stream-recorder/twitch-recorder.py -q $quality -u $username"
sleep infinity
