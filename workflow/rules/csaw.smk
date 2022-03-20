rule rule1:
    input:
        b1 = "",
        b2 = "",
        b0 = ""
    output:
        bed = ""
    script:
        "scripts/consensus.R"

rule rule1:
    input:
        b1 = "",
        b2 = "",
        b0 = ""
    output:
        bed = ""
    message:
        ""
    script:
        "scripts/consensus.R"

rule filter:
    input:
        b1 = "",
        b2 = "",
        b0 = ""
    output:
        bed = ""
    message:
        ""
    script:
        "scripts/consensus.R"

rule csaw_normalization:
    input:
        b1 = "",
        b2 = "",
        b0 = ""
    output:
        bed = ""
    message:
        ""
    script:
        "scripts/normalization.R"