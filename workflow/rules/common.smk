# Author: James Ashmore
# Copyright: Copyright 2021, Zifo RnD Solutions
# Email: james.ashmore@zifornd.com
# License: MIT

import pandas
import snakemake

# Sample table
samples = pd.read_table(config["samples"]).set_index("sample", drop = False)

# Units table
units = pd.read_table(config["units"]).set_index(["sample", "unit"], drop = False)

# Global constraints
wildcard_constraints:
    sample = "|".join(samples.index),
    unit = "|".join(units.index)


def is_single_end(sample, unit):
	return pandas.isnull(units.loc[(sample, unit), "fq2"])

def is_paired_end(sample, unit):
	return pandas.notnull(units.loc[(sample, unit), "fq2"])

def all_single_end(sample):
	return all(pandas.isnull(units.loc[sample, "fq2"]))

def all_paired_end(sample):
	return all(pandas.notnull(units.loc[sample, "fq2"]))

def get_fastqs(wildcards):
    if is_single_end(wildcards.sample, wildcards.unit):
        u = units.loc[(wildcards.sample, wildcards.unit), "fq1"]
        return {"fq1": u}
    else:
        u = units.loc[(wildcards.sample, wildcards.unit), ["fq1", "fq2"]]
        return {"fq1": u.fq1, "fq2": u.fq2}

def get_sample_units(wildcards):
	return units.loc[wildcards.sample, "unit"]

def get_condition_samples(wildcards):
	return samples.loc[samples["condition"] == wildcards.condition, "sample"]

def get_final_output():

	output = []

	for sample, unit in units.index:

		output.append(f"results/bowtie2/{sample}_{unit}.bam")
	
	return output
