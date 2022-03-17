# Author: James Ashmore
# Copyright: Copyright 2021, Zifo RnD Solutions
# Email: james.ashmore@zifornd.com
# License: MIT

rule macs2_callpeak:
	input:
		bed = ""
	output:
		multiext(
			"results/macs2/{sample}",
			"_peaks.broadPeak"
		)
	shell:
		"macs2 callpeak -t {input.bed} -f BEDPE -n {wildcards.sample} -g mm --broad --broad-cutoff 0.05 --keep-dup all"
