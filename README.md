# Домашнее задание к занятию «Организация сети» — Муравский Артем

---

### Часть 1. Yandex Cloud

Создан VPC (network) с подсетями:

1. public — `192.168.10.0/24`
2. private — `192.168.20.0/24`

Поднят NAT-инстанс со статическим адресом `192.168.10.254` и route table для private-подсети (`0.0.0.0/0 → 192.168.10.254`).

Создано две виртуалки:

- `public-instance` — в public-подсети, с внешним IP
- `private-instance` — в private-подсети, без внешнего IP

Схема сети:
![](img/yc-network-1.png)
![](img/yc-network-2.png)

NAT-инстанс:
![](img/yc-nat.png)

Публичная ВМ:
![](img/yc-public-instance.png)

Приватная ВМ (без внешнего IP):
![](img/yc-private-instance.png)

SSH-доступ к публичной ВМ:
![](img/yc-ssh-public.png)

Интернет из приватной ВМ через NAT:
![](img/yc-net-from-private.png)

---

### Часть 2. AWS

Создан VPC `vpc-15` (`10.10.0.0/16`) с подсетями:

1. public-subnet — `10.10.1.0/24` (AZ `eu-north-1a`)
2. private-subnet — `10.10.2.0/24` (AZ `eu-north-1b`)

Созданы:

3. Internet Gateway + route table `public-rt` (`0.0.0.0/0 → igw`)
4. NAT Gateway с Elastic IP + route table `private-rt` (`0.0.0.0/0 → nat`)
5. Security Group `15` (SSH 22/tcp + ICMP)
6. Два EC2-инстанса: `bastion` (с публичным IP) и `private` (без публичного IP)

VPC:
![](img/aws-vpc.png)

Публичная подсеть:
![](img/aws-public-subnet.png)

Приватная подсеть:
![](img/aws-private-subnet.png)

Публичная таблица маршрутизации и ассоциация с подсетью:
![](img/aws-public-rt.png)
![](img/aws-public-rt-associations.png)

Приватная таблица маршрутизации и ассоциация с подсетью:
![](img/aws-private-rt.png)
![](img/aws-private-rt-associations.png)

NAT Gateway и Elastic IP:
![](img/aws-nat.png)
![](img/aws-eip.png)

EC2 `bastion` и `private`:
![](img/aws-instances.png)

SSH-доступ к публичной (bastion) ВМ:
![](img/aws-ssh-public.png)

Интернет из приватной ВМ через NAT:
![](img/aws-net-from-private.png)

---

### Команды

Конфигурация лежит в папках `yandex-cloud/` и `aws/`, запускается независимо:

```bash
cd yandex-cloud && terraform init && terraform apply
cd aws && terraform init && terraform apply
```

Проверка NAT:

```bash
# Yandex Cloud: вход приватную ВМ посредством туннеля через публичную
ssh -J ubuntu@<внешний_ip_nat> ubuntu@192.168.20.x
curl ifconfig.me

# AWS: вход приватную ВМ посредством туннеля через публичную (бастион)
ssh -J ubuntu@<bastion_public_ip> ubuntu@10.10.2.x
curl ifconfig.me
```

Уборка ресурсов:

```bash
cd yandex-cloud && terraform destroy
cd aws && terraform destroy
```
