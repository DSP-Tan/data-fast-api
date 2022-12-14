#!/bin/bash
source .env
docker run \
	-e CHUNK_SIZE=1000 \
	-e LOCAL_REGISTRY_PATH=$LOCAL_REGISTRY_PATH \
	-e LOCAL_DATA_PATH=$LOCAL_DATA_PATH \
	-e DATASET_SIZE=$DATASET_SIZE \
	-e DATA_SOURCE=$DATA_SOURCE \
	-e MODEL_TARGET=$MODEL_TARGET \
	-e VALIDATION_DATASET_SIZE=$VALIDATION_DATASET_SIZE \
        -e LOCAL_DATA_PATH=$HOME/.lewagon/mlops/data \
        -e LOCAL_REGISTRY_PATH=$HOME/.lewagon/mlops/training_outputs \
        -e DATASET_SIZE=1k \
        -e VALIDATION_DATASET_SIZE=1k \
        -e CHUNK_SIZE=6000 \
        -e DATA_SOURCE=local \
        -e MODEL_TARGET=mlflow \
        -e PROJECT=omega-clarity-337815 \
        -e REGION=europe-west1 \
        -e BUCKET_NAME=wagon-data-1234-tanner \
        -e BLOB_LOCATION=data \
        -e MULTI_REGION=EU \
        -e DATASET=taxifare_dataset \
        -e INSTANCE=taxi-instance \
        -e IMAGE_PROJECT=ubuntu-os-cloud \
        -e IMAGE_FAMILY=ubuntu-2204-lts \
        -e PREFECT_BACKEND=development \
        -e PREFECT_FLOW_NAME=taxifare_lifecycle_DSP-Tan \
        -e PREFECT_LOG_LEVEL=WARNING \
        -e MODEL_TARGET=mlflow \
        -e MLFLOW_TRACKING_URI=https://mlflow.lewagon.ai \
        -e MLFLOW_EXPERIMENT=taxifare_experiment_DSP-Tan \
        -e MLFLOW_MODEL_NAME=taxifare_DSP-Tan \
        -e IMAGE=taxifare \
        -e GCR_MULTI_REGION=eu.gcr.io \
        -e MEMORY=2Gi \
	-e PORT=8000 \
	-p 8000:8000  $GCR_MULTI_REGION/$PROJECT/$IMAGE:prod
