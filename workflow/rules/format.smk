rule rule1:
    input:
        bam = ""
    output:
        bam = pipe("")
    message:
        "Sort by read name"
    shell:
        "samtools sort -n -o {output.bam} {input.bam}"

rule rule2:
    input:
        bam = ""
    output:
        bam = pipe("")
    message:
        "Fix read mates"
    shell:
        "samtools fixmate {input.bam} {output.bam}"

rule rule3:
    input:
        bam = ""
    output:
        bed = pipe("")
    message:
        "BEDPE conversion"
    shell:
        "samtools view -bf 0x2 {input.bam} | bedtools bamtobed -i stdin -bedpe > {output.bed}"

rule rule4:
    input:
        bed = ""
    output:
        bed = pipe("")
    message:
        "Tn5 shift"
    script:
        "scripts/bedpeTn5shift.sh {input.bed} > {output.bed}"

rule rule4:
    input:
        bed = ""
    output:
        bed = ""
    message:
        "Minimal conversion"
    script:
        "scripts/bedpeMinimalConvert.sh {input.bed} > {output.bed}"