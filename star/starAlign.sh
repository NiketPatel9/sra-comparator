#!/usr/bin/env bash
# starAlign.sh

pairedFolder="Paired/"

leftSuffix=".R1.paired.fastq"
rightSuffix=".R2.paired.fastq"

outputSam="sam/"
mkdir -p $outputSam

for file in $pairedFolder*$leftSuffix
do
  pathRemoved="${file/$pairedFolder/}"
  sampleName="${pathRemoved/$leftSuffix/}"
  rightRead=$pairedFolder$sampleName$rightSuffix
  ../STAR/bin/Linux_x86_64/STAR --runThreadN 8 \
  --genomeDir GenomeIndices \
  --readFilesIn $file,$rightRead \
  --outFileNamePrefix $outputSam$sampleName
done
