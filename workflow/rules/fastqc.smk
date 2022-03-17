# Author: James Ashmore
# Copyright: Copyright 2021, Zifo RnD Solutions
# Email: james.ashmore@zifornd.com
# License: MIT

rule fastqc:
    input:
        fqz = "results/fastq/{sample}_{unit}{read}.fastq.gz"
    output:
        ext = multiext("results/fastqc/{sample}_{unit}{read,.*}_fastqc", ".html", ".zip")
    params:
        out = "results/fastqc"
    log:
        out = "results/fastqc/{sample}_{unit}{read}_fastqc.out",
        err = "results/fastqc/{sample}_{unit}{read}_fastqc.err"
    message:
        "[fastqc] Generate quality control report for {input.fqz}"
    threads:
        1
    conda:
        "../envs/fastqc.yaml"
    shell:
        "fastqc -o {params.out} -t {threads} {input.fqz} 1> {log.out} 2> {log.err}"