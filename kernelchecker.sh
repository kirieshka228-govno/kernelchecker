#!/usr/bin/env bash

currentyadro=$(uname -r)

latestyadro=$(curl -s https://www.kernel.org/finger_banner | awk '/latest stable version/{print $NF}')

if [ -z "$latestyadro" ]; then
    echo "Чо то не так пошло alo✔"
    exit 1
fi

newestyadro=$(printf '%s\n' "$currentyadro" "$latestyadro" | sort -V | tail -n1)

if [ "$newestyadro" = "$latestyadro" ] && [ "$currentyadro" != "$latestyadro" ]; then
    echo "Новая обнова da✔ $latestyadro (у тебя $currentyadro)"
else
    echo "Брат у тебя последнее ядро✔ $currentyadro"
fi