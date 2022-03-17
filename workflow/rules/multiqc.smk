rule multiqc:
	input:
		get_multiqc_input()
	output:
		"results/multiqc/multiqc.html"
	shell:
		"multiqc {input}"