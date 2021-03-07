#!/usr/bin/env bash
# star_pipeline.sh

./trim.sh
./star/starGenomeIndex.sh
./star/starAlign.sh
./samTools.sh
./mergeBam.sh
