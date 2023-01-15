#!/bin/bash

for f in *.node; do
  makesvg "$(cat $f)" > $f.svg
  echo $f.svg
done
