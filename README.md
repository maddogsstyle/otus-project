<img src="https://img.shields.io/github/v/tag/maddogsstyle/otus-project?label=version" />

# Описание проекта
Данный проект является итоговой квалификационной работой по завершении курса "DevOps практики и инструменты"
Составными частями проекта являются:

1. Развернутая инфраструктура, включающая в себя:
	- Оркестратор микросервисов: Kubernetes (v1.22)
	- Брокер сообщений: RabbitMQ (v3.11.2)
	- База данных: MongoDB (v3.2)

2. Сервис,обеспечивающий непрерывную интеграции/развертывание:
	- Менеджер CI/CD: Gitlab CI (в планах)

3. Инструменты, осуществляющие логирование и мониторинг:
	- Prometheus (v2.39.1)
	- Grafana (v9.2.4)

4. Непосредственно приложение, состоящее из двух компонентов:
	- UI
	- Backend

# Описание приложения
Приложение представляет из себя поисковый сервис, обрабатывающий одну или несколько веб-страниц на предмет наличия заданных в поисковом запросе слов или словосочетаний.
В качестве результата работы сервис возвращает URL страниц наряду с количеством запрашивамых вхождений.

# Необходимые компоненты
Для работы приложения необходимы следующие утилиты:

- yc
- Helm

# Порядок установки
(Этого раздела не будет, если удастся оформить "PRESS X TO WIN")

1. Кластер разворачивается автоматически средствам `yc`:
```
./cluster.sh
```
2. После успешного разворачивания кластера необходимо установить project chart:
```
cd kubernetes/Charts
helm install project ./project
```
3. После этого необходимо узнать ADDRESS приложения RabbitMQ
```
kubectl get ingress
```
и подставить его в `./project/values.yaml`

4. Затем необходимо выполнить команду 
```
kubectl get ingress
``` 

снова и перейти по адресу HOSTS, принадлежащему RabbitMQ.

5. Войти в консоль управления RabbitMQ, используя имя пользователя `user` и пароль, являющийся выводом команды
```
kubectl get secret --namespace default project-rabbitmq -o jsonpath="{.data.rabbitmq-password}" | base64 -d
```
6. Перейти во вкладу `Queues` и добавить новую очередь `mqqueue` с типом `Durability: Transient`
7. Выполнить команду 
```
helm install mongodb ./mongodb
```
8.  Выполнить команду
```
kubectl get svc
```
и подставить полученные значения в файл `./crawler/templates/deployment.yaml`


9. Наконец, можно выполнить команду
```
helm install crawler ./crawler
helm install ui ./ui
kubectl get svc
```
перейти по EXTERNAL IP для приложения `ui` и пользоваться развернутым сервисом.
# Первый старт

PRESS X TO WIN

# Мониторинг и логирование

## Prometheus

Для входа в UI необходимо выполнить команду:

```
kubectl port-forward svc/pro-kube-prometheus-stack-prometheus 9090
```

Prometheus будет доступен по адресу:

`http://localhost:9090/`

## Grafana

Для входа в UI необходимо выполнить команду:

```
kubectl port-forward svc/pro-grafana 8880
```

Grafana будет доступна по адресу:

`http://localhost:8880/`