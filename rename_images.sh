#!/bin/bash

# Change to your target directory
cd /home/rohit/Pictures/Screenshots/dataset/ || exit 1

# Start counter
i=1

# Find and sort supported image files (case-insensitive)
for f in $(find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.bmp" -o -iname "*.gif" -o -iname "*.tiff" -o -iname "*.webp" \) | sort); do
    ext="${f##*.}"                        # Get file extension
    newname=$(printf "%05d.%s" "$i" "$ext")  # Format new name like 00001.jpg
    mv -- "$f" "$newname"                # Rename file
    ((i++))
done
