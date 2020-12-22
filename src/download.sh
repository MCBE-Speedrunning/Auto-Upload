#!/usr/bin/env sh

# Download the videos listed in `../runs.txt`

SCRIPT_PATH=$(cd "$(dirname "$0")" && pwd)
DATA_DIR="$SCRIPT_PATH/.."

cd "$DATA_DIR/videos/"
cut -d " " -f 2 "$DATA_DIR/runs.txt" | while read -r URI
do
	case "$URI" in
		*twitch*)
			echo "1" | "$DATA_DIR/twitch-dl.1.13.0.pyz" download "$URI" ;;
		*)
			youtube-dl "$URI" ;;
	esac
done
