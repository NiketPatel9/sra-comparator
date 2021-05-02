#!/usr/bin/env bash
# star_pipeline.sh

./trim.sh
./star/starGenomeIndex.sh
./star/starAlign.sh
./samTools.sh
./mergeBam.sh
./assemble_transcriptome.sh
./assemblyStats.sh > STAROUTPUT.txt
rm -rf ./GenomeIndices
rm -rf ./trinity_out_dir
rm -rf ./sam
rm -rf ./bam
rm -rf ./sortedBam
