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

#### TopHat
TopHat is an aligner that does not rely on known splice sites and is commonly used as part of the Tuxedo pipeline. It uses a fellow member of the pipeline,
Bowtie, to assist it in alignment. TopHat identifies possible splice junctions based on the reference genome [5]. To achieve ideal alignment, TopHat
splits all input reads into smaller segments, which are then mapped independently [5]. These segments are put together at the end of the program for final
end-to-end alignments. For more information on TopHat as well as its manual for running, click here: https://ccb.jhu.edu/software/tophat/manual.shtml

In order to install TopHat, download tophat-2.1.1.tar.gz from the following link: https://ccb.jhu.edu/software/tophat/downloads/

Note, you will also need to install Boost after downloading the boost_1_76_0.tar.gz file from the following link, and placing it
in the same directory as the tophat-2.1.1.tar.gz file: https://www.boost.org/users/download/

Then, unzip the tar.gz file in the appropriate location according to the directory tree below. Navigate to the folder containing
the tar.gz file, which should be in the same directory as the sra-comparator project, and then run the following commmands:
```
tar xvfz boost_1_76_0.tar.gz
cd boost_1_76_0
./bootstrap.sh
./b2 link=static runtime-link=static stage install
cd ..
tar zxvf tophat-2.1.1.tar.gz

```
 
### Samtools Sorting
The samtools utility will be used to convert SAM files from the alignment step to the BAM format, which is ideal for 
transcriptome assembly using Trinity. In order to install the latest version of samtools: install from the 
following link: http://www.htslib.org/download/ (Version 1.11) was used for this project. Make sure that the samtools
directory is adjacent the project directory, as shown in the directory structure below. In order to configure samtools,
run the following commands:
```
sudo apt-get update
cd samtools-1.11
./configure --prefix=/usr
make
sudo make install
samtools --version
```

### Trinity Transcriptome Assembly
The aligners will be tested by comparing the results of using their alignment to assemble transcriptomes. In order to
assemble the transcriptome from the bam file produced by samtools, Trinity will be used. Trinity has the ability
to perform a transcriptome assembly and then run statistics on that assembly in order to glean helpful numbers like the
N50 statistic.

#### Trinity
Trinity can be downloaded from here https://github.com/trinityrnaseq/trinityrnaseq/releases

This project is using version 2.11.0. The tar.gz file should be unzipped and then placed in the appropriate location.
Also, the Jellyfish package should be installed similarly to samtools above via the following link:
https://github.com/gmarcais/Jellyfish/releases (Version 2.3.0 is used for this project)

#### Jellyfish
Trinity requires Jellyfish in order to run, and the following commands should be run after Jellyfish has been downloaded 
to the proper location:
```
sudo apt-get update
cd jellyfish-2.3.0
./configure --prefix=$HOME
make
sudo make install
sudo ldconfig
```

#### Bowtie
Trinity requires Bowtie2 in order to run, and the following commands should be run to install it:
```
sudo apt update
sudo apt install bowtie2
```


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
└───tophat-2.1.1
|
└───samtools-1.11
|   |   configure
|
└───jellyfish-2.3.0
|   |   configure
|
|___trinityrnaseq-v2.11.0
|   |
|   |   Trinity
|   |
|   └─── util
|        |
|        |  TrinityStats.pl
|
└───sra-comparator (this directory)
    │   (you are here)
```


### References
1. Bolger, Anthony M., Marc Lohse, and Bjoern Usadel. "Trimmomatic: A Flexible Trimmer for Illumina Sequence Data." Bioinformatics 30.15 (2014): 2114-120. Web.
2. Dobin, A., Davis, C. A., Schlesinger, F., Drenkow, J., Zaleski, C., Jha, S., Batut, P., Chaisson, M., & Gingeras, T. R. "STAR: ultrafast universal RNA-seq aligner." Bioinformatics (Oxford, England), 29(1), (2013). 15–21. Web.
3. Giacomo Baruzzo, Katharina E Hayer, Eun Ji Kim, Barbara Di Camillo, Garret A FitzGerald, and Gregory R Grant. "Simulation-based comprehensive benchmarking of RNA-seq aligners." Nature Methods (Padua, Italy) 14 (2017): 135-139. Web.
4. Jeffrey A. Martin and Zhong Wang. "Next-generation transcriptome assembly." Nature Reviews Genetics (Walnut Creek, CA) 12 (2011): 671-683. Web.
5. Trapnell, C., Patcher, L., Salzberg S. L. "TopHat: discovering splice junctions with RNA-Seq." Bioinformatics (Oxford, England), 25 (9), (2009). 1105-1111. Web.
