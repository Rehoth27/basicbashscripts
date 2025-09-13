#!/bin/bash

# Ensure ImageMagick is installed
# Arch Linux: sudo pacman -S imagemagick

INPUT_DIR="${1:-.}"        # Default: current directory
OUTPUT_DIR="$INPUT_DIR/output_png"

mkdir -p "$OUTPUT_DIR"

echo "Converting images in: $INPUT_DIR"
echo "Saving as PNGs in:   $OUTPUT_DIR"

shopt -s nullglob
for img in "$INPUT_DIR"/*.{jpg,jpeg,png,webp,avif,tif,tiff,bmp,JPG,JPEG,PNG,WEBP,AVIF,TIF,TIFF,BMP}; do
    filename=$(basename "$img")
    name="${filename%.*}"
    output_file="$OUTPUT_DIR/$name.png"

    echo "Processing: $img -> $output_file"
    convert "$img" "$output_file"
done

echo "✅ All images converted to proper PNGs!"
:
