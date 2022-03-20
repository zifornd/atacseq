# Author: James Ashmore
# Copyright: Copyright 2022, James Ashmore
# Email: james.ashmore@zifornd.com
# License: MIT

main <- function(input, output) {

    # Log

    out <- file(log$out, open = "wt")

    err <- file(log$err, open = "wt")

    sink(out, type = "output")

    sink(err, type = "message")

    # Script

    bed <- rtracklayer::import.bed(input$bed)

    chr <- readLines(input$txt)

    par <- readParam(max.frag = 1000, pe = "both", discard = bed, restrict = chr)

    out <- regionCounts(input$bam, all.peaks, param=param)

    saveRDS(out, file = output$rds)

}

main(snakemake@input, snakemake@output)