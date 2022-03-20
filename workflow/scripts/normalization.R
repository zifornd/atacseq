# Author: James Ashmore
# Copyright: Copyright 2022, James Ashmore
# Email: james.ashmore@zifornd.com
# License: MIT

FUN <- function(x) {

    normFactors(binned, se.out=peak.counts.tmm)

}

main <- function(input, output) {

    # Log

    out <- file(log$out, open = "wt")

    err <- file(log$err, open = "wt")

    sink(out, type = "output")

    sink(err, type = "message")

    # Script

    library(csaw)

    library(edgeR)

    dat <- READ

    ave <- aveLogCPM(asDGEList(data))

    idx <- ave > -1

    filtered.data <- data[idx, ]

    saveRDS(out, file = output$rds)

}

main(snakemake@input, snakemake@output)