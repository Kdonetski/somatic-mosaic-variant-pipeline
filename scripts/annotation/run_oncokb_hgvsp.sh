
#!/bin/bash

#BSUB -J oncokb
#BSUB -o /project/knathans_shared/donetski/OncoKB_annotations/oncokb.%J.out
#BSUB -e /project/knathans_shared/donetski/OncoKB_annotations/oncokb.%J.err

IMAF="/home/donetski/oncokb_reannotation_input_all_variants.txt"
OMAFHGVSG="/project/knathans_shared/donetski/OncoKB_annotations/oncokb_hgvsp_output_allsamples.txt"
TOKEN="5256d8fc-f283-40d3-a093-99fc54be6af7"

/home/donetski/venvs/oncokb_venv/bin/python /home/donetski/oncokb-annotator-current/MafAnnotator.py \
    -i "$IMAF" \
    -o "$OMAFHGVSG" \
    -b "$TOKEN" \
    -q hgvsp

