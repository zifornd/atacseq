# Author: James Ashmore
# Copyright: Copyright 2021, Zifo RnD Solutions
# Email: james.ashmore@zifornd.com
# License: MIT

rule nucleoatac_occ:
	input:
		bed = "{sample}.bed",
		bam = "{sample}.bam",
		fas = "results/genomepy/{genome}/{genome}.fa"
	output:
		multiext(
			"output_basename",
			".occ.bedgraph.gz",
			".occ.lower_bound.bedgraph.gz",
			".occ.upper_bound.bedgraph.gz",
			".nuc_dist.txt",
			".nuc_dist.eps",
			".fragmentsizes.txt",
			".occ_fit.txt",
			".occ_fit.eps",
			".occpeaks.bed.gz"
		)
	params:
		out = "results/nucleoatac/{sample}"
	shell:
		"nucleoatac run --bed {input.bed} --bam {input.bam} --fasta {input.fas}--out {params.out} --cores {threads}"


rule nucleoatac_vprocess:
	input:
		bed = "{sample}.bed",
		bam = "{sample}.bam",
		fas = "results/genomepy/{genome}/{genome}.fa"
	output:
		multiext(
			"output_basename",
			".occ.bedgraph.gz",
			".occ.lower_bound.bedgraph.gz",
			".occ.upper_bound.bedgraph.gz",
			".nuc_dist.txt",
			".nuc_dist.eps",
			".fragmentsizes.txt",
			".occ_fit.txt",
			".occ_fit.eps",
			".occpeaks.bed.gz"
		)
	params:
		out = "results/nucleoatac/{sample}"
	shell:
		"nucleoatac run --bed {input.bed} --bam {input.bam} --fasta {input.fas}--out {params.out} --cores {threads}"

rule nucleoatac_nuc:
	input:
		bed = "{sample}.bed",
		bam = "{sample}.bam",
		fas = "results/genomepy/{genome}/{genome}.fa"
	output:
		multiext(
			"output_basename",
			".occ.bedgraph.gz",
			".occ.lower_bound.bedgraph.gz",
			".occ.upper_bound.bedgraph.gz",
			".nuc_dist.txt",
			".nuc_dist.eps",
			".fragmentsizes.txt",
			".occ_fit.txt",
			".occ_fit.eps",
			".occpeaks.bed.gz"
		)
	params:
		out = "results/nucleoatac/{sample}"
	shell:
		"nucleoatac run --bed {input.bed} --bam {input.bam} --fasta {input.fas}--out {params.out} --cores {threads}"