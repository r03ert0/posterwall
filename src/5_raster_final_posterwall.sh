#!/bin/bash

# 1: resize document to fit images

# 2: put a background coloured rectangle

# 3: save a pdf version

# 4: dzi for the website
vips dzsave ../data/derived/posterwall-final.pdf ../data/derived/posterwall-neuroferret2021.zip

# 5: dzi for checking
vips dzsave ../data/derived/posterwall-final.pdf ../data/derived/dzi

# 6: make the dzi.js file (which is basically the dzi.dzi file)

# 7: make the .json file, adapting the position of the camera icons

# 8: get the gps coordinates for making the "poster list"