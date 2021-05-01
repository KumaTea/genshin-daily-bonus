#!/usr/bin/env bash


set -ex

export USER_AGENT="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36"
COOKIES=$(cat cookies.txt)
export COOKIE="$COOKIES"

python3 genshin.py
