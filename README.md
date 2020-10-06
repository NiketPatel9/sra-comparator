# Short Read Alignment

## Niket Patel

## Methods
This project will explore various splice-aware short-read alginers as described by Martin and Wang [3]. The aligners are STAR, TopHat, GSNAP, SpliceMap,
and MapSplice. Because we are comparing aligners, a reference-based strategy will be taken towards transcriptome assembly. These
five aligners output either BAM or SAM format, making them ideal for comparison.

Testing of this project involved usage of the *Aiptasia pallida* reads in the form of FASTQ files. A QC sequencing run
was used to produce a small number of reads. The input for this project should be a folder indicating where the 
FASTQ files representing the run are located. 

For initial testing purposes, I defined this folder as: 

`../AiptasiaReads`

Within this folder, there were 50 FASTQ Files, representing 24 different organisms each with a forward strand and
reverse strand (R1 and R2). A similar setup is advised when running this project.

Make sure that Trimmomatic [1] is downloaded in a folder adjacent to `../AiptasiaReads` in `../Trimmomatic-0.39`. Trimmomatic
can be downloaded with the following link:

http://www.usadellab.org/cms/?page=trimmomatic

Download the binary version under "Downloading Trimmomatic" (version 0.39 works with this project).

In short, your folder structure should look like this:

```
..    
│
└───AiptasiaReads (or any other directory of FASTQ files)
│   │   Aip02.R1.fastq
|   |   Aip02.R2.fastq
│   │   Aip05.R1.fastq
│   
└───Trimmomatic-0.39
|   |   LICENCSE
|   |   trimmomatic-0.39.jar
|   |
|   └─── adapters
|
└───sra-comparator (this directory)
    │   (you are here)
```



### References
1. Bolger, Anthony M., Marc Lohse, and Bjoern Usadel. "Trimmomatic: A Flexible Trimmer for Illumina Sequence Data." Bioinformatics 30.15 (2014): 2114-120. Web.
2. Giacomo Baruzzo, Katharina E Hayer, Eun Ji Kim, Barbara Di Camillo, Garret A FitzGerald, and Gregory R Grant. "Simulation-based comprehensive benchmarking of RNA-seq aligners." Nature Methods (Padua, Italy) 14 (2017): 135-139. Web.
3. Jeffrey A. Martin and Zhong Wang. "Next-generation transcriptome assembly." Nature Reviews Genetics (Walnut Creek, CA) 12 (2011): 671-683. Web.
