#!/usr/bin/env bash
# starGenomeIndex.sh

mkdir -p GenomeIndices

../STAR/bin/Linux_x86_64/STAR --runThreadN 8 \
--runMode genomeGenerate \
--genomeDir GenomeIndices \
--genomeFastaFiles ../AiptasiaReads/GCA_001417965.1_Aiptasia_genome_1.1_genomic.fna \
--sjdbGTFtagExonParentTranscript Parent \
--sjdbGTFfile ../AiptasiaReads/GCA_001417965.1_Aiptasia_genome_1.1_genomic.gff \
--sjdbOverhang 99