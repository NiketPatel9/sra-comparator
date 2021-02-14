#!/usr/bin/env bash
# assemble_transcriptome.sh

nice -n19 /usr/local/programs/trinityrnaseq-Trinity-v2.8.4/Trinity \
--genome_guided_bam sortedBam/AipAll.bam \
--genome_guided_max_intron 10000 \
--max_memory 10G --CPU 4 \
&
