#!/usr/bin/env bash
# samTools.sh

samFolder="sam/"
outputBam="bam/"
samExtension="out.sam"
mkdir -p $outputBam

for file in $samFolder*$samExtension
do
  pathRemoved="${file/$samFolder/}"
  sampleName="${pathRemoved/$samExtension/}"
  samtools view -S -b $file > $outputBam${sampleName}bam
done

outputSorted="sortedBam/"
bamExtension=".bam"
mkdir -p $outputSorted

for file in $outputBam*$bamExtension
do
  pathRemoved="${file/$outputBam/}"
  sampleName="${pathRemoved/$bamExtension/}"
  samtools sort $file ${outputSorted}${sampleName}.sorted
done


for file in $outputSorted*
do
  samtools index $file
done