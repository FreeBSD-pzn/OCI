```
Несколько файлов для создания bucket S3 и
таблицы в DynamoDB для реализации блокировки в
Amazon Web Services.

Файлы:
AWS/main.tf     - описание провайдера
TF/s3_bucket.tf - создание bucket S3 для хранения файлов состояния terraform
TF/dynamodb.tf  - создание таблицы в базе данных DynamoDB

В данном случае выбор был сделан только для того, чтобы оттестировать в одном
проекте сервисы, предоставляемые разными провайдерами.

В данной папке (директрии) содержится все необходимое для создания необходимой
инфраструктуры для организации хранения фалов состояния terraform.

После создания ресурсов можно добавить файл ../TF/backend.tf и выполнить
$ terraform init
$ terraform plan
$ terraform apply
для переноса файлов состояния terraform в bucket S3.
```