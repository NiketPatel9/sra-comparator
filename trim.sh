#!/usr/bin/env bash
# trim.sh

# Define all relevant folders and suffixes
fastqDir='../AiptasiaReads/'
fastqSuffix=".fastq"
leftReadSuffix=".R1.fastq"
rightReadSuffix=".R2.fastq"
pairedSuffix=".paired.fastq"
unpairedSuffix=".unpaired.fastq"
pairedFolder="Paired/"
unpairedFolder="Unpaired/"

mkdir -p $pairedFolder
mkdir -p $unpairedFolder

# Trim each forward and reverse read in the FASTQ director, outputting to Paired and Unpaired folders
function trimReads {

    for file in $fastqDir*$leftReadSuffix
    do
      leftRead=$file
      rightRead="${file/$leftReadSuffix}$rightReadSuffix"
      pairedLeftRead="${leftRead/$fastqSuffix}$pairedSuffix"
      unpairedLeftRead="${leftRead/$fastqSuffix}$unpairedSuffix"
      pairedRightRead="${rightRead/$fastqSuffix}$pairedSuffix"
      unpairedRightRead="${rightRead/$fastqSuffix}$unpairedSuffix"

      java -jar ../Trimmomatic-0.39/trimmomatic-0.39.jar PE -phred33 \
      "$leftRead" \
      "$rightRead" \
      "$pairedFolder${pairedLeftRead#"$fastqDir"}" \
      "$unpairedFolder${unpairedLeftRead#"$fastqDir"}" \
      "$pairedFolder${pairedRightRead#"$fastqDir"}" \
      "$unpairedFolder${unpairedRightRead#"$fastqDir"}" \
      HEADCROP:0 \
      ILLUMINACLIP:../Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 \
      LEADING:20 TRAILING:20 SLIDINGWINDOW:4:30 MINLEN:36


    done
}
trimReads  &
