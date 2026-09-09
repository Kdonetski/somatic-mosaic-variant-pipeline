# Somatic Mosaic Variant Analysis



Code for sequencing QC, annotation, filtering, and candidate prioritization of somatic mosaic variants in breast cancer susceptibility genes.



## Overview



Low-level mosaic variants are present in only a subset of cells and may occur at lower variant allele frequencies than heterozygous germline variants, making them harder to detect with conventional germline testing. 



This project develops a computational workflow for identifying and prioritizing candidate somatic mosaic variants from high-depth targeted sequencing data. Candidate variants are called using Mutect2 and DeepVariant variant callers and subsequently processed through quality-control, annotation, and filtering steps to distinguish potentially meaningful low-VAF variants from sequencing artifacts and common population variation.



The analysis incorporates several external annotation resources:



- **ClinVar** for clinical pathogenicity classifications

- **OncoKB** for oncogenicity and cancer-related variant annotations

- **gnomAD** for population allele frequencies

- **SpliceAI** and other functional annotations for additional evidence of potential variant impact



Candidate variants are evaluated through multiple filtering branches that apply complementary filtering criteria. These branches are subsequently combined to generate a prioritized set of variants for downstream review and validation.



## Analysis Workflow



The repository contains notebooks covering two main components of the analysis.



### Quality Control



QC notebooks examine sequencing and variant characteristics prior to candidate filtering. These analyses include coverage comparisons, target-region checks, variant allele frequency distributions, alternate-read depth, sample-frequency patterns, and related exploratory analyses used to evaluate filtering thresholds and sequencing quality.



### Variant Annotation and Prioritization



The downstream workflow processes candidate variants through annotation and filtering steps that incorporate clinical, population, and functional annotations.



## Analysis Workflow



1. **Variant calling**: Candidate variants are identified using Mutect2 and DeepVariant.

2. **Initial QC and filtering**: Variants are filtered using sequencing quality, allele frequency, alternate-read depth, and related criteria.

3. **Annotation**: Variants are annotated with external clinical, population, and functional databases.

4. **Evidence-based filtering**: Candidate variants are evaluated across three complementary branches using:

   - ClinVar pathogenicity classifications

   - OncoKB oncogenicity annotations

   - gnomAD population frequencies and functional evidence such as SpliceAI

5. **Integration of filtering branches**: Results from the three branches are combined into a unified candidate set.

6. **Candidate prioritization and validation**: Prioritized variants are reviewed manually and can be evaluated using the Integrative Genomics Viewer (IGV), mosaic-specific callers, and experimental validation.


## Repository Structure

```text
notebooks/
├── qc/
│   └── sequencing QC and exploratory analyses
├── workflow/
│   └── annotation, filtering, and candidate prioritization
└── exploratory/
    └── additional analyses and investigations
```
