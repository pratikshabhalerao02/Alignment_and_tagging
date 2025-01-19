## Indexing the genome
bwa-0.7.12/bwa index -a hg38

##BWA alignment 
/bwa-0.7.12/bwa mem /hg38_index/hg38.fa -t sample_R1.fastq.gz sample_R2.fastq.gz > sample.sam

##Converting .sam --> .bam
/samtools-1.2/samtools view -bS -@ 8 sample.sam -o sample.bam 

##Sorting the bam file
/samtools-1.2/samtools sort -@ 8 sample.bam -T sample.sorted -o sample.sorted.bam

##Indiexing of the sorted bam 
/samtools-1.3.1/samtools index sample.sorted.bam

##Tagging the bam  
/jdk1.8.0_231/bin/java -jar picard.jar AddOrReplaceReadGroups I=sample.sorted.bam O=sample.withtags.bam RGID=sample RGLB=LIB RGPL=illumina RGSM=sample  RGPU=sample CREATE_INDEX=true
