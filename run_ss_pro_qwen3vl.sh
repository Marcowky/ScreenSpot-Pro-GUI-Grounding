#!/bin/bash
set -e

# English

# Qwen3-VL series
ckpts=("/home/kaiyu/Model/Qwen/Qwen3-VL-8B-Instruct")
for ckpt in "${ckpts[@]}"
do
    python eval_screenspot_pro_parallel.py  \
        --model_type "qwen3vl"  \
        --model_name_or_path ${ckpt}  \
        --screenspot_imgs "/home/kaiyu/Ref_repo/ScreenSpot-Pro-GUI-Grounding-Old/data/ScreenSpot-Pro/images"  \
        --screenspot_test "/home/kaiyu/Ref_repo/ScreenSpot-Pro-GUI-Grounding-Old/data/ScreenSpot-Pro/annotations"  \
        --task "all" \
        --language "en" \
        --gt_type "positive" \
        --log_path "./results/${ckpt}.json" \
        --inst_style "instruction" \
        --num_gpu 4
done