#!/bin/bash

#BSUB -J split_oncokb
#BSUB -o /project/knathans_shared/donetski/OncoKB_annotations/split_oncokb%J.out
#BSUB -e /project/knathans_shared/donetski/OncoKB_annotations/split_oncokb%J.err


INPUT_TXT="/project/knathans_shared/donetski/OncoKB_annotations/oncokb_hgvsp_output_allsamples.txt"
OUTPUT_DIR="/project/knathans_shared/donetski/OncoKB_annotations/split_oncokb_hgvsp_outputs"

mkdir -p "$OUTPUT_DIR"

python3 - "$INPUT_TXT" "$OUTPUT_DIR" <<'PY'
import sys
from pathlib import Path
import pandas as pd

input_txt = Path(sys.argv[1])
output_dir = Path(sys.argv[2])

df = pd.read_csv(
    input_txt,
    sep="\t",
    dtype=str,
    low_memory=False
)

sample_col = "Tumor_Sample_Barcode"

if sample_col not in df.columns:
    raise KeyError(
        f"Column '{sample_col}' was not found. "
        f"Available columns: {df.columns.tolist()}"
    )

df[sample_col] = df[sample_col].str.strip()

df = df[
    df[sample_col].notna()
    & df[sample_col].ne("")
    & df[sample_col].ne(".")
].copy()

for sample_id, sample_df in df.groupby(sample_col, sort=False):
    output_file = output_dir / f"{sample_id}_oncokb_hgvsp_output.csv"
    sample_df.to_csv(output_file, index=False)

print(f"Created {df[sample_col].nunique()} sample CSV files")
print(f"Saved to: {output_dir}")
PY
