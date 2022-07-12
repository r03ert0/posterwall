#!/bin/bash

for f in ../data/raw/posters/*.p*; do
  echo "converting $f"
  base=$(basename "$f")
  filename=${base%.*}
  ext=${f##*.}
  case $ext in
    "pdf")
    pdftoppm "$f" -r 300 -jpeg -jpegopt quality=95 -scale-to 1000 -singlefile "../data/derived/thumbnails/$filename"
    ;;
    "png")
    convert "$f" -resize 1000x "../data/derived/thumbnails/$filename.jpg"
    ;;
  esac
done
