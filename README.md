# ISP System - тестовые стенды для обучения

Установка:

- ISP Manager,
- VM Manager (ver. 6),
- Bill Manager
  на виртуальные машины VirtualBox через Vagrant.

## Установка

Запустить Vagrant

```bash
vagrant up
```

### ISP Manager

1. Подключиться к панеле ISP Manager с хост машины

```bash
127.0.0.1:8888
```

Для входа использовать: **root**/root

2. Активировать триальную лицензию (т.к. панель находится за NAT, то активировать можно только вручную по ключу).

Подключиться к машине:

```bash
vagrant ssh ispmngr
```

Удалить файл лицензии

```bash
sudo rm -rf /usr/local/mgr5/etc/ispmgr.lic
```

Скачать файл заново

```bash
sudo /usr/local/mgr5/sbin/licctl fetch ispmgr <код лицензии из личного кабинет>
```

### VM manager

После старта виртуальное машины для vmmanager необходимо зайти на нее и продолжить установку с указанием лицензионного ключа:

```bash
    vagrant ssh vmmngr
    sudo -i
    /tmp/vm install -l <key>
```

После окончания установки зайти в браузер с хост ос по ссылке:

```
https://192.168.20.11/auth/setup?token=<key>
```

и создать пользователя.
VMmanager готов к работе.

---

## Документация

### Vagrantfile файл

Создание трех машин на CentOs 8 (2 CPU, 4 G RAM):

- ispmngr (192.168.20.10)
- vmmngr (192.168.20.11)
- billmngr (192.168.20.12)

### ISP Manager machine

Установка триальной версии. По окончании установки нужно получить ключ и активировать систему по ключу (ссылка #5).

Дополнительно будут установлены:

- веб-серверы — Apache MPM-ITK, Nginx и дополнительные программы (PHP module, awstats, logrotate, PHP-FPM);
- почтовые серверы — Dovecot, Exim и дополнительные программы (RoundCube, sieve);
- DNS-сервер — BIND;
- FTP-сервер — ProFTP;
- веб-интерфейс администрирования MySQL — phpMyAdmin;
- PHP версий 5.6, 7.4, 8.0 Apache module, CGI, PHP-FPM;
- сервис fail2ban;
- модуль интеграции с конструктором сайтов Site.Pro;
- модуль интеграции с антивирусной системой ImunifyAV.

Доступ к isp manager после установки:

    https://l4cbbe6c.justinstalledpanel.com:1500/ispmgr
    https://10.0.2.15:1500/ispmgr

    Login: root
    Password: <пароль root из системы>

Для доступа с хост ОС сделан проброс портов, доступ:

    127.0.0.1:8888

### VM manager

Для установки VMmanager необходима лицензия. Получить
триальную версию можно по запросу на сайте (ссылка #7).

## 🔗 Ссылки

#1. [ispsystem.ru](https://docs.ispsystem.ru/)  
#2. [Документация ISPmanager 6 Lite, Pro, Host](https://docs.ispsystem.ru/ispmanager6-lite)  
#3. [Информация о триальной версии](https://www.ispsystem.ru/support/knowledge-base/trials)  
#4. [Цены на лицензии ISPmanager 6, сравнительная таблица](https://www.isplicense.ru/services/ispsystem/ispmanager6/)  
#5. [Инструкция по активации лицензии по ключу](https://docs.ispsystem.ru/coremanager/litsenzii-ispsystem/aktivatsiya-litsenzii-po-klyuchu)
#6. [Установка VMmanager 6](https://docs.ispsystem.ru/vmmanager-admin/ustanovka-i-nachalo-raboty/ustanovka)
#7. [VMmanager. Запрос демо](https://www.ispsystem.ru/software/vmmanager)
