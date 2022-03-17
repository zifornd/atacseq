rule bowtie2:
	input:
		fq1 = "results/cutadapt/{sample}_{unit}_1.fastq.gz",
		fq2 = "results/cutadapt/{sample}_{unit}_2.fastq.gz"
	output:
		sam = pipe("results/bowtie2/{sample}_{unit}.sam")
	shell:
		"bowtie2 -X 1000 -x {params.idx} -1 {input.fq1} -2 {input.fq2}"
