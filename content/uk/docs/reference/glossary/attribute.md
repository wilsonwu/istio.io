---
title: Атрибут
test: no
---

Атрибути контролюють поведінку сервісів під час виконання в мережі. Атрибути є іменованими та типізованими частками метаданих, які описують вхідний та вихідний трафік і середовище, в якому цей трафік зʼявляється. Атрибут Istio несе конкретну частку інформації, наприклад, код помилки API запиту, затримку API запиту або початкову IP-адресу TCP зʼєднання. Наприклад:

{{< text yaml >}}
request.path: xyz/abc
request.size: 234
request.time: 12:34:56.789 04/17/2017
source.ip: 192.168.0.1
destination.workload.name: example
{{< /text >}}

Атрибути використовуються функціями [політики та телеметрії](https://istio.io/v1.6/docs/reference/config/policy-and-telemetry/) Istio.
