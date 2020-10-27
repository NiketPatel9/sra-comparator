# Short Read Alignment

## Niket Patel

## Methods
This project will explore various splice-aware short-read aligners as described by Martin and Wang [3]. The aligners are STAR, TopHat, GSNAP, SpliceMap,
and MapSplice. Because we are comparing aligners, a reference-based strategy will be taken towards transcriptome assembly. These
five aligners output either BAM or SAM format, making them ideal for comparison. This project takes place in a Linux 
environment using 8 Cores on an i7 processor. Please consider the size of the genome you are using before running the 
scripts in this repository.

### Sample Data
Testing of this project involved usage of the *Aiptasia pallida* reads in the form of FASTQ files. A QC sequencing run
was used to produce a small number of reads. The input for this project should be a folder indicating where the 
FASTQ files representing the run are located. This folder should also contain the reference genome, which can be
in .fna format.

For initial testing purposes, I defined this folder as: 

`../AiptasiaReads`

Within this folder, there were 50 FASTQ Files, representing 24 different organisms each with a forward strand and
reverse strand (R1 and R2). A similar setup is advised when running this project.

### Quality Trimming
Make sure that Trimmomatic [1] is downloaded in a folder adjacent to `../AiptasiaReads` in `../Trimmomatic-0.39`. Trimmomatic
can be downloaded with the following link:

http://www.usadellab.org/cms/?page=trimmomatic

Download the binary version under "Downloading Trimmomatic" (version 0.39 works with this project).

### Aligners

#### Star
STAR is an aligner that achieves solid results due to its algorithm that achieves highly efficient mapping through
seed searching followed by clustering, stitching, and scoring [2].

Installation and setup instructions are here and should be followed prior to running this project: https://github.com/alexdobin/STAR/blob/master/doc/STARmanual.pdf

The source repository is here: https://github.com/alexdobin/STAR
 

In short, your folder structure should look like this:

```
..    
│
└───AiptasiaReads (or any other directory of FASTQ files)
│   │   Aip02.R1.fastq
|   |   Aip02.R2.fastq
│   │   Aip05.R1.fastq
│   |   ...
|   |   GCA_001417965.1_Aiptasia_genome_1.1_genomic.fna (Aiptasia Genome)
|   |   GCA_001417965.1_Aiptasia_genome_1.1_genomic.gff (Genome Anntotation File)
|
└───Trimmomatic-0.39
|   |   LICENCSE
|   |   trimmomatic-0.39.jar
|   |
|   └─── adapters
|
└───STAR
|   |  
|   └─── bin
|
└───sra-comparator (this directory)
    │   (you are here)
```



### References
1. Bolger, Anthony M., Marc Lohse, and Bjoern Usadel. "Trimmomatic: A Flexible Trimmer for Illumina Sequence Data." Bioinformatics 30.15 (2014): 2114-120. Web.
2. Dobin, A., Davis, C. A., Schlesinger, F., Drenkow, J., Zaleski, C., Jha, S., Batut, P., Chaisson, M., & Gingeras, T. R. "STAR: ultrafast universal RNA-seq aligner." Bioinformatics (Oxford, England), 29(1), (2013). 15–21. Web.
3. Giacomo Baruzzo, Katharina E Hayer, Eun Ji Kim, Barbara Di Camillo, Garret A FitzGerald, and Gregory R Grant. "Simulation-based comprehensive benchmarking of RNA-seq aligners." Nature Methods (Padua, Italy) 14 (2017): 135-139. Web.
4. Jeffrey A. Martin and Zhong Wang. "Next-generation transcriptome assembly." Nature Reviews Genetics (Walnut Creek, CA) 12 (2011): 671-683. Web.
