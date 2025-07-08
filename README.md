# Challenge APP

Este repositório foi criado para um desafio técnico e pode ser utilizado para futuras referências.

## Instalação e Configuração

Requisitos e recomendação para o projeto

* Docker e Docker Compose
* Sistema Linux (Qualquer distro)

### Rodando o projeto

```bash
$ docker compose up -d
```

Isso irá inicializar os containers

* api: backend em rails formato API RESTful
* client: frontend em vue 3
* database: banco de dados com postgresql
* cache: banco in-memory redis (não foi utilizado no projeto até então)
* mail: caixa de email local (não foi utilizado no projeto até então)
