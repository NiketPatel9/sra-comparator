#!/usr/bin/env bash
# trim.sh

fastqDir='../AiptasiaReads'

function trimAll {
    java -jar ../Trimmomatic-0.39/trimmomatic-0.39.jar PE -phred33 \
    ${fastqDir}/Aip02.R1.fastq \
    ${fastqDir}/Aip02.R2.fastq \
    Aip02.R1.paired.fastq \
    Aip02.R1.unpaired.fastq \
    Aip02.R2.paired.fastq \
    Aip02.R2.unpaired.fastq \
    HEADCROP:0 \
    ILLUMINACLIP:../Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 \
    LEADING:20 TRAILING:20 SLIDINGWINDOW:4:30 MINLEN:36
}
trimAll 1>trimAll.log 2>trimAll.err &

#
#if [ -d $dir ]
#then
#
#else
#  echo "Doesn't"
#fi


#