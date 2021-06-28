export MAX_LENGTH=350
export MODEL_NAME=t5-large
export DATA_DIR=data
export OUTPUT_DIR=t5-large
export BATCH_SIZE=3
export NUM_EPOCHS=8
export SAVE_STEPS=1000
export SEED=42

!python CUDA_VISIBLE_DEVICES=0 python3 run_summarization.py \
    --seed 42 \
    --model_name_or_path $MODEL_NAME \
    --num_train_epochs $NUM_EPOCHS \
    --warmup_ratio 0.1 \
    --do_train \
    --do_eval \
    --train_file $DATA_DIR/train.csv \
    --validation_file $DATA_DIR/test.csv \
    --source_prefix "summarize: " \
    --output_dir $OUTPUT_DIR \
    --overwrite_output_dir \
    --per_device_train_batch_size $BATCH_SIZE \
    --per_device_eval_batch_size $BATCH_SIZE \
    --text_column 'output' \
    --summary_column 'task' \
    --save_total_limit 8 \
    --gradient_accumulation_steps 1 \
    --evaluation_strategy "steps" \
    --eval_steps $SAVE_STEPS \
    --logging_steps $SAVE_STEPS \
    --save_steps $SAVE_STEPS \
    --predict_with_generate \