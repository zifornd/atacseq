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

}

main(snakemake@input, snakemake@output)