# fase5-infra-kubernetes

Infra Kubernetes com Terraform.

- [fase5-infra-kubernetes](#fase5-infra-kubernetes)
  - [Tech Challenge](#tech-challenge)
  - [LocalStack](#localstack)
  - [Alunos](#alunos)

## Tech Challenge

Projeto realizado durante o quarto módulo da Pós Tech Software Architecture da FIAP.

## LocalStack

Para levantar o LocalStack é necessário ter o Docker e o Docker Compose instalados:

```bash
docker-compose up
```

Estamos utilizando o SQS para a coreografia de eventos entre os microsserviços, e o Localstack permite testarmos tudo localmente.

Exemplos de comandos para criar e enviar mensagens para a fila SQS localmente com o LocalStack:

```bash
aws --endpoint http://localhost:4566 --profile localstack sqs create-queue --queue-name pedidoRecebido
aws --endpoint http://localhost:4566 --profile localstack sqs send-message --queue-url http://localhost:4566/000000000000/pedidoRecebido --message-body "Hello World SQS!!!"
aws --endpoint http://localhost:4566 --profile localstack sqs receive-message --queue-url http://localhost:4566/000000000000/pedidoRecebido
```

Referências

- https://www.baeldung.com/java-spring-cloud-aws-v3-intro
- https://medium.com/@anchan.ashwithabg95/using-localstack-sns-and-sqs-for-devbox-testing-fa09de5e3bbb
- https://docs.localstack.cloud/user-guide/aws/sqs/
- https://dev.to/flflima/rodando-sqs-localmente-com-localstack-3nap

## Alunos

|                                          Nome |     RM     |
|----------------------------------------------:| :--------: |
|                  Elvis Freitas Lopes Herllain | `rm349139` |
|                          Gisele Mara Leonardi | `rm349242` |
|                 Leandro Gonçalves de Oliveira | `rm348615` |
|                      Marcos Venâncio de Souza | `rm349251` |
|                               Pablo Lima Dias | `rm349149` |
