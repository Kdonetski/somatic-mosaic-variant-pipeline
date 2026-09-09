#!/bin/bash
#BSUB -J gnomad41_annotation_run2
#BSUB -e gnomad41_annotation_run2.%J.error
#BSUB -o gnomad41_annotation_run2.%J.out

# Path to ANNOVAR directory
ANNOVAR_DIR="/misc/appl/annovar-2023/"

# Path to the gnomAD annotation database
GNOMAD_DB="/project/knathans_shared/resources/annovar/humandb/"

# Input file
INPUT_FILE="/home/donetski/gnomad_reannotation_input_headers.avinput"

# Output directory
OUT_DIR="/project/knathans_shared/donetski/Run2_gnomad41_reannotation_with_header"

# Make output folders
mkdir -p "${OUT_DIR}/exome_result"
mkdir -p "${OUT_DIR}/genome_result"

# Run ANNOVAR - gnomAD exome
cd "${OUT_DIR}/exome_result"

${ANNOVAR_DIR}/table_annovar.pl ${INPUT_FILE} ${GNOMAD_DB} \
  -buildver hg38 \
  -out annotated_output \
  -remove \
  -protocol gnomad41_exome \
  -operation f \
  -nastring . \
  -otherinfo \
  -csvout

echo "Annotation completed with gnomad 41 exome"

# Run ANNOVAR - gnomAD genome
cd "${OUT_DIR}/genome_result"

${ANNOVAR_DIR}/table_annovar.pl ${INPUT_FILE} ${GNOMAD_DB} \
  -buildver hg38 \
  -out annotated_output \
  -remove \
  -protocol gnomad41_exome,gnomad41_genome \
  -operation f,f \
  -nastring . \
  -otherinfo \
  -csvout

echo "Annotation completed with gnomad 41 genome"


