#!/bin/bash

cat <<EOT > ../data/derived/posterwall-final.svg
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:xlink="http://www.w3.org/1999/xlink"
   width="6000mm"
   height="4400mm"
   viewBox="0 0 4400 6000"
  >
EOT

row=0
col=0
for f in ../data/derived/thumbnails/*.jpg; do
  g=$(basename "$f")
  echo $g
  echo "<image xlink:href=\"rasterised/$g\" y=\""$((-(3-col)*1200))"\" x=\""$((-(3-row)*1500))"\" height=\"1000\" width=\"1458.5164\" />" >> ../data/derived/posterwall-final.svg
  row=$((row+1))
  if ((row==5)); then
    row=0
    col=$((col+1))
  fi
done

echo "</svg>" >> ../data/derived/posterwall-final.svg

