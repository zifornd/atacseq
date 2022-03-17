rule cutadapt:
	input:
		fq1 = "data/{sample}_{unit}_1.fastq.gz",
		fq2 = "data/{sample}_{unit}_2.fastq.gz"
	output:
		fq1 = "results/cutadapt/{sample}_{unit}_1.fastq.gz",
		fq2 = "results/cutadapt/{sample}_{unit}_2.fastq.gz"
	log:
		out = "results/cutadapt/{sample}/{unit}.out",
		err = "results/cutadapt/{sample}/{unit}.err"
	message:
		"Remove adapter sequences from paired-end library: {wildcards.sample} {wildcards.unit}"
	threads:
		1
	conda:
		"../envs/cutadapt.yaml"
	shell:
		"cutadapt -j {threads} -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -m 33 -e 0.005 -O 7 -o {output.fq1} -p {output.fq2} {input.fq1} {input.fq2} 1> {log.out} 2> {log.err}"
