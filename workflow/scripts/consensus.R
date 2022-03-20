# Author: James Ashmore
# Copyright: Copyright 2022, James Ashmore
# Email: james.ashmore@zifornd.com
# License: MIT

read.broadPeak <- function(file) {

    ext <- c(signalValue = "numeric", pValue = "numeric", qValue = "numeric")

    bed <- rtracklayer::import.bed(file, format = "BED", extraCols = ext)

}

write.broadPeak <- function(x, file = "") {

    rtracklayer::export.bed(x, )

}

FUN1 <- function(treatment, control) {

    union(Reduce(union, treatment), Reduce(union, control))

}

FUN2 <- function(treatment, control) {

    union(Reduce(intersect, treatment), Reduce(intersect, control))

}

FUN3 <- function(treatment, control) {

    union(treatment, control)

}

main <- function(input, output) {

    # Log


    # Script

    bp1 <- lapply(input$A, read.broadPeak)
    
    bp2 <- lapply(input$B, read.broadPeak)

    bp0 <- FUN()

    write.broadPeak()

}

main(snakemake@input, snakemake@output)