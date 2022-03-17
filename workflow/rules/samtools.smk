
rule sample:
	input:
		bam = lambda wildcards: expand("{sample}_{unit}.bam", sample = wildcards.sample, unit = units.loc[wildcards.sample, "unit"])
	output:
		bam = "{sample}.bam"
	message:
		"Merge"
	shell:
		""

rule condition:
	input:
		bam = lambda wildcards: expand("{sample}.bam", sample = samples.loc[wildcards.condition, "sample"])
	output:
		bam = "results/{condition}.bam"
	message:
		"Merge"
	shell:
		"samtools merge {output.bam} {input.bam}"

rule samtools_sort:
	input:
		sam = "results/bowtie2/{sample}_{unit}.sam",
	output:
		bam = "results/bowtie2/{sample}_{unit}.bam"
	shell:
		"samtools sort -@ {threads} -o {output.bam} {input.sam}"

rule samtools_merge:
    input:
        bam = lambda wildcards: expand("results/bowtie2/{sample}_{unit}.bam"
    output:
        bam = "results/samtools/merge/{sample}.bam"
    shell:
        "samtools merge {output.bam} {input.bam}"