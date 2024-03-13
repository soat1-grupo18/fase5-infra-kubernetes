#!/bin/bash

set -v

awslocal sns create-topic \
  --name ms-pedido

awslocal sqs create-queue \
  --queue-name ms-pagamento-evento-pedido-recebido

awslocal sns subscribe \
  --topic-arn arn:aws:sns:us-east-1:000000000000:ms-pedido \
  --protocol sqs \
  --notification-endpoint arn:aws:sqs:us-east-1:000000000000:ms-pagamento-evento-pedido-recebido \
  --attributes '{ "RawMessageDelivery": "true" }'

awslocal sqs create-queue \
  --queue-name ms-producao-evento-pedido-recebido

awslocal sns subscribe \
  --topic-arn arn:aws:sns:us-east-1:000000000000:ms-pedido \
  --protocol sqs \
  --notification-endpoint arn:aws:sqs:us-east-1:000000000000:ms-producao-evento-pedido-recebido \
  --attributes '{ "RawMessageDelivery": "true" }'