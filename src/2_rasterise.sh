#!/bin/bash

for f in ../data/raw/posters/*.p*; do
  echo "rasterising $f"
  base=$(basename "$f")
  filename=${base%.*}
  ext=${f##*.}
  H=$(convert "../data/derived/thumbnails/$filename.jpg" -print "%h" /dev/null)
  W=$(awk "BEGIN{print int(5000*1000/"$H")}")
  # echo $W $H
  case $ext in
    "pdf")
    pdftoppm "$f" -r 300 -jpeg -jpegopt quality=95 -scale-to "$W" -singlefile "../data/derived/rasterised/$filename"
    ;;
    "png")
    convert "$f" -resize "${W}x" "../data/derived/rasterised/$filename.jpg"
    ;;
  esac
done
