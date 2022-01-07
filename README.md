```
Несколько файлов для создания виртуальной машины в
Oracle Cloud Infrastructure.

Создается виртуальная машина с необходимым сетевым окружением.
Для создания виртуальной машины используются ALWAYS FREE ресурсы
Oracle Cloud Infrastructure.

Можно создавать 2 виртуальные машины VM.Standard.E2.1.Micro
и одну VM.Standard.A1.Flex со следующими параметрами:
CPU <= 4
RAM <= 24, чтобы получить всегда бесплатный вариант виртуальной машины.

Файлы:
provider.tf           - все что необходимо для OCI
images.tf             - бесплатные образы виртуальных машин в регионе eu-frankfurt-1
network.tf            - все необходимое для настройки сетевого окружения
variable.tf.template  - шаблон файла variable.tf заполните свои данные
vm01.tf               - создание образа виртуальной машины

Oracle Cloud Infrastructure позволяет бесплатно запускать две витруальные
машины. Чтобы получить вторую виртуальную машину просто скопируйте файл
vm01.tf скажем в vm02.tf и в скопированном файле измените имена второй
виртуальной машины. Можете также выбрать другой образ для второй виртуальной
машины.

p.s.
Все ресурсы создаются под tenancy, т.е. под root в OCI.

Если созданы compartment и есть необходимость создать ресурсы
в необходимом compartment, то измените значения с

compartment_id    = var.tenancy_ocid
на
compartment_id    = var.compartment_ocid
во всех файлах.

Посмотрите дополнительно файл Instructions.txt
```