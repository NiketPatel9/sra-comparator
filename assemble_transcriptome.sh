#!/usr/bin/env bash
# assemble_transcriptome.sh

../trinityrnaseq-v2.11.0/Trinity --genome_guided_bam sortedBam/AipAll.bam \
--genome_guided_max_intron 10000  --max_memory 10G --CPU 4