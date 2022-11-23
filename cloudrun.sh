#!/bin/bash

##gcloud run deploy --image $GCR_MULTI_REGION/$PROJECT/$IMAGE:prod --memory $MEMORY --region $REGION --env-vars-file .env.yaml                 [🐍 3.8.5]

##ERROR: (gcloud.run.deploy) unrecognized arguments: --env-vars-file (did you mean '--set-env-vars'?)

##To search the help text of gcloud commands, run:
##  gcloud help -- SEARCH_TERMS


source .env
gcloud run deploy --image $GCR_MULTI_REGION/$PROJECT/$IMAGE:prod --memory $MEMORY --region $REGION \
	--set-env-vars CHUNK_SIZE=${CHUNK_SIZE} \
	--set-env-vars LOCAL_REGISTRY_PATH=$LOCAL_REGISTRY_PATH \
	--set-env-vars LOCAL_DATA_PATH=$LOCAL_DATA_PATH \
	--set-env-vars DATASET_SIZE=$DATASET_SIZE \
	--set-env-vars DATA_SOURCE=$DATA_SOURCE \
	--set-env-vars MODEL_TARGET=$MODEL_TARGET \
	--set-env-vars VALIDATION_DATASET_SIZE=$VALIDATION_DATASET_SIZE \
        --set-env-vars PROJECT=$PROJECT \
        --set-env-vars REGION=$REGION \
        --set-env-vars BUCKET_NAME=wagon-data-1234-tanner \
        --set-env-vars BLOB_LOCATION=data \
        --set-env-vars MULTI_REGION=EU \
        --set-env-vars DATASET=taxifare_dataset \
        --set-env-vars INSTANCE=taxi-instance \
        --set-env-vars IMAGE_PROJECT=ubuntu-os-cloud \
        --set-env-vars IMAGE_FAMILY=ubuntu-2204-lts \
        --set-env-vars PREFECT_BACKEND=development \
        --set-env-vars PREFECT_FLOW_NAME=taxifare_lifecycle_DSP-Tan \
        --set-env-vars PREFECT_LOG_LEVEL=WARNING \
        --set-env-vars MLFLOW_TRACKING_URI=https://mlflow.lewagon.ai \
        --set-env-vars MLFLOW_EXPERIMENT=taxifare_experiment_DSP-Tan \
        --set-env-vars MLFLOW_MODEL_NAME=taxifare_DSP-Tan \
        --set-env-vars IMAGE=taxifare \
        --set-env-vars GCR_MULTI_REGION=eu.gcr.io \
        --set-env-vars MEMORY=2Gi 

