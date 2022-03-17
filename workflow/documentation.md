# Documentation

## Configuration

The workflow is configured by editing the following files:

- `config/config.yaml` 
- `config/samples.tsv`
- `config/units.tsv`

An error will be thrown if these files are missing or not formatted correctly.

### Workflow config

The workflow config is a YAML file containing information about the workflow
parameters:

* Each line contains a name-value pair
* Each name-value pair corresponds to a workflow parameter

The workflow config must contain the following pairs:

| Name | Value | Example |
| --- | --- | --- |
| samples | Path to sample sheet | config/samples.tsv |
| platform | Bioconductor platform data package | pd.hugene.1.0.st.v1 |
| annotation | Bioconductor annotation data package  | hugene10sttranscriptcluster.db |
| organism | Bioconductor organism data package | org.Hs.eg.db |
| contrasts | Contrast name and conditions in sample table | treatment-control |

Contrasts for differential expression analysis are defined as shown below:

```yaml
contrasts:
    treatment-control:
        - treatment
        - control
```

Below is an example of a valid workflow config:

```yaml
samples: config/samples.tsv
platform: pd.hugene.1.0.st.v1
annotation: hugene10sttranscriptcluster.db
organism: org.Hs.eg.db
contrasts:
    treatment-control:
        - treatment
        - control
```

For this example, the workflow will install the platform, annotation, and organism Bioconductor packages and run a differential expression analysis on the treatment versus control conditions.

### Sample table

The sample table is a TSV file containing data on the experimental design:

* Each row corresponds to one sample
* Each column corresponds to one attribute

For each sample, you must provide the following columns:

| Column | Description | Example |
| --- | --- | --- |
| sample | Sample name | S1 |
| condition | Condition | treatment |
| filename | Array file | S1.CEL |

To incorporate batch effects and blocking, you must add the following columns:

| Column | Description | Example |
| --- | --- | --- |
| batch | Batch effect | S1-B1 |
| block | Sample pairing | S1-P1 |

Below is an example of a valid sample table:

```
sample  condition   filename batch  block
S1      C           S1.CEL   A      A   
S2      C           S2.CEL   A      B
S3      C           S1.CEL   B      C
S4      T           S2.CEL   A      A
S5      T           S3.CEL   A      B
S6      T           S4.CEL   B      C
```

Missing values can be specified by empty columns or by writing `NA` in the relevent entry.

### Unit table

The unit table is a TSV file containing data on the sequencing units:

* Each row corresponds to one unit
* Each column corresponds to one attribute

For each unit, you must provide the following columns:

| Column | Description | Example |
| --- | --- | --- |
| sample | Sample name | A |
| unit | Unit name | 1 |
| fq1 | Path to read1 | A1_1.fastq.gz |
| fq2 | Path to read1 | A1_2.fastq.gz |

Below is an example of a valid unit table:

```
sample  unit	fq1			fq2	
A		1		A1.fastq.gz	A1.fastq.gz 
A		2		A2.fastq.gz 
B		1		B1.fastq.gz 
B		2		B2.fastq.gz  
C		1		C1.fastq.gz 
C		2		C2.fastq.gz 
D		1		D1.fastq.gz 
D		2		D2.fastq.gz 
```

Missing values can be specified by empty columns or by writing `NA` in the relevent entry.

## Results

The workflow writes all output files to the `results` directory. This directory
is created upon execution and has the following layout:

```console
results
├── annotate.rds
├── boxplot.pdf
├── {contrast}.goana.tsv
├── {contrast}.heatmap.pdf
├── {contrast}.kegga.tsv
├── {contrast}.pvalue.pdf
├── {contrast}.topgo.pdf
├── {contrast}.topkegg.pdf
├── {contrast}.toptable.tsv
├── {contrast}.volcano.pdf
├── annotate.rds
├── boxplot.pdf
├── correct.rds
├── dens.pdf
├── filter.rds
├── hm.pdf
├── import.rds
├── ma.pdf
├── mds.pdf
├── model.rds
├── msd.pdf
├── normalize.rds
├── pca.pdf
└── rle.pdf
```

The output files are named after each rule in the workflow. Any
contrast-specific files are prefixed with the contrast name. See below for an
explanation of each output file:

### Quality control

| File | Format | Description |
| --- | --- | --- |
| `{sample}_fastqc.html` | XLS | Test results |
| `{sample}_fastqc.html` | XLS | Test results |
| `results/cutadpt/{sample}.fastq.gz` | BED6+4 | Histogram of p-values |

### Alignment

| File | Format | Description |
| --- | --- | --- |
| `{sample}_peaks.xls` | XLS | Test results |
| `{sample}_peaks.narrowPeak` | BED6+4 | Histogram of p-values |
| `{sample}_summits.bed` | BED | Volcano plot |
| `{sample}_peaks.broadPeak` | BED6+3 | Heatmap of gene expression |
| `{sample}_peaks.gappedPeak` | BED12+3 | Hello |
| `{sample}_model.r` | R | | 
| `{sample}_treat_pileup.bdg` | bedGraph | |
| `{sample}_control_lambda.bdg` | bedGraph | |

### Peak calling

| File | Format | Description |
| --- | --- | --- |
| `{sample}_peaks.xls` | XLS | Test results |
| `{sample}_peaks.narrowPeak` | BED6+4 | Histogram of p-values |
| `{sample}_summits.bed` | BED | Volcano plot |
| `{sample}_peaks.broadPeak` | BED6+3 | Heatmap of gene expression |
| `{sample}_peaks.gappedPeak` | BED12+3 | Hello |
| `{sample}_model.r` | R | | 
| `{sample}_treat_pileup.bdg` | bedGraph | |
| `{sample}_control_lambda.bdg` | bedGraph | |

### Differential accessibility

| File | Format | Description |
| --- | --- | --- |
| `{sample}_peaks.xls` | XLS | Test results |
| `{sample}_peaks.narrowPeak` | BED6+4 | Histogram of p-values |
| `{sample}_summits.bed` | BED | Volcano plot |
| `{sample}_peaks.broadPeak` | BED6+3 | Heatmap of gene expression |
| `{sample}_peaks.gappedPeak` | BED12+3 | Hello |
| `{sample}_model.r` | R | | 
| `{sample}_treat_pileup.bdg` | bedGraph | |
| `{sample}_control_lambda.bdg` | bedGraph | |


### Peaks

### Motifs

### Footprints

### Nucleosome positioning

