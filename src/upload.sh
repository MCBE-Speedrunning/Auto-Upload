#!/usr/bin/env sh

# Uploads the videos in `../Videos` to YouTube
# Only 6 videos are uploaded a day, as that is the
# maximum that is allowed by Googles quota.

SCRIPT_PATH=$(cd "$(dirname "$0")" && pwd)
VID_DIR="$SCRIPT_PATH/../videos"

find "$VID_DIR/" -iname "*.*"| head -n 6 | while read -r VIDEO
do
	VIDEO=$(basename "$VIDEO")
	youtube-upload --title="$VIDEO" --category="Gaming" --client-secrets="credentials.json" "$VID_DIR/$VIDEO"
	rm "$VID_DIR/$VIDEO"
done
