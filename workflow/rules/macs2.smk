# Author: James Ashmore
# Copyright: Copyright 2021, Zifo RnD Solutions
# Email: james.ashmore@zifornd.com
# License: MIT

rule macs2_callpeak:
	input:
		bed = "results/{sample}.bed"
	output:
		multiext(
			"results/macs2/{sample}",
			"_peaks.broadPeak"
		)
    params:
        ::
    log:
        out = "results/macs2/{}.out",
        err = "results/macs2/{}.err"
    message:
        "Call significant broad peaks (FDR < 0.05)"
    conda:
        "../envs/macs2.yaml"
	shell:
		"macs2 callpeak -t {input.bed} -f BEDPE -n {wildcards.sample} -g mm --broad --broad-cutoff 0.05 --keep-dup all"
