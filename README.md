<img src="https://img.shields.io/github/v/tag/maddogsstyle/otus-project?label=version" />
# otus-project

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
	- Что-то для логов
	- Что-то для мониторинга

4. Непосредственно приложение, состоящее из двух компонентов:
	- UI
	- Backend

# Описание приложения
Приложение представляет из себя поисковый сервис, обрабатывающий одну или несколько веб-страниц на предмет наличия заданных в поисковом запросе слов или словосочетаний.
В качестве результата работы сервис возвращает URL страниц наряду с количеством запрашивамых вхождений.

# Необходимые компоненты
Для работы приложения необходимы:

- Что-то
- Что-то еще

# Порядок установки

Кластер разворачевается автоматически средствам `yc`:
```
./cluster.sh
```

# Первый старт

(Этого раздела не будет, если удастся оформить "PRESS X TO WIN")