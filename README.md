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

Referências

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
