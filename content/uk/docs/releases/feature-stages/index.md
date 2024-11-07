---
title: Стан функцій
description: Перелік функцій та етапи їх випуску.
weight: 10
aliases:
    - /uk/docs/reference/release-roadmap.html
    - /uk/docs/reference/feature-stages.html
    - /uk/docs/welcome/feature-stages.html
    - /uk/docs/home/roadmap.html
    - /uk/about/feature-stages
    - /uk/latest/about/feature-stages
owner: istio/wg-docs-maintainers
test: n/a
---

Ця сторінка містить інформацію про відносну зрілість і рівень підтримки кожної функції Istio. Зверніть увагу, що фази застосовуються до окремих функцій проєкту, а не до проєкту в цілому. Ось короткий опис того, що означають ці позначення.

## Визначення фаз функцій {#feature-phase-definitions}

|                       | Experimental | Alpha | Beta | Stable |
|-----------------------|---|---|---|---|
| Призначення           | Функція знаходиться на стадії активної розробки, і API для користувачів може змінюватися. Користувачі повинні розгортати експериментальні функції з великою обережністю, бажано в промислових середовищах, оскільки експериментальні версії можуть вимагати зусиль для міграції. | Використовується для отримання зворотного звʼязку щодо дизайну або функції або для перевірки того, як попередній дизайн працює тощо. Розрахована на розробників та досвідчених користувачів. | Використовується для перевірки рішення в промисловому середовищі без довгострокових зобовʼязань для оцінки життєздатності, продуктивності, зручності тощо. Орієнтована на всіх користувачів. | Надійна, випробувана в операційній діяльності функція. |
| Стабільність          | Може містити помилки. Використання функції може призвести до виявлення помилок. Стандартно вимкнена. | Може містити помилки. Використання функції може призвести до виявлення помилок. Стандартно вимкнена. | Код добре протестований. Функцію безпечно використовувати в промисловому середовищі. | Код добре протестований і стабільний. Безпечна для масового впровадження у промисловому середовищі. |
| Безпека               | Використання функції може мати очевидні вразливості в безпеці. Виявлені вразливості можуть не повідомлятися широко. | Використання функції може мати очевидні вразливості в безпеці. Виявлені вразливості можуть не повідомлятися широко. | Будь-які виявлені вразливості в безпеці будуть публічно розкриті та виправлені. | Будь-які виявлені вразливості в безпеці будуть публічно розкриті та виправлені. |
| Продуктивність        | Характеристики продуктивності невідомі. Увімкнення експериментальної функції може негативно вплинути на продуктивність. | Вимоги до продуктивності оцінюються під час проєктування. | Продуктивність і масштабованість охарактеризовані, але можуть мати застереження. | Продуктивність (затримка/масштабованість) кількісно визначені та задокументовані з гарантіями проти регресу. |
| Підтримка             | Немає гарантій щодо зворотної сумісності. Спільнота Istio не зобовʼязується покращувати, підтримувати або завершувати функцію, і вона може бути повністю видалена у наступних випусках без попередження. | Немає гарантій щодо зворотної сумісності. Istio не зобовʼязується завершувати функцію. Функція може бути видалена у наступних випусках без попередження. | Основна функція не буде видалена, хоча деталі можуть змінитися. Istio зобовʼязується завершити функцію у подальшій стабільній версії. Зазвичай це відбувається протягом 3 місяців, але іноді довше. Випуски повинні підтримувати дві послідовні версії (наприклад, v1alpha1 та v1beta1 або v1beta1 та v1) одночасно протягом одного циклу підтримки випусків (зазвичай 3 місяці), щоб користувачі мали достатньо часу для оновлення та міграції ресурсів. | Функція буде присутня у багатьох наступних випусках. |
| Правила припинення підтримки  | Відсутні, функція може бути видалена будь-коли. | Відсутні, функція може бути видалена будь-коли. | Слабкі, функція може бути видалена з попередженням за 3 місяці. | Сильні, функція може бути видалена з попередженням за 1 рік, але зазвичай буде підтримуваний шлях оновлення до замінюючої функції. |
| Версії                | Назва версії API містить `dev` (наприклад, v1dev1). | Назва версії API містить `alpha` (наприклад, v1alpha1). | Назва версії API містить `beta` (наприклад, v1beta1). | Версія API — це `vX`, де X — це ціле число (наприклад, v1). |
| Доступність           | Функція може бути або не бути доступною в основному репозиторії Istio. Вона може (не)зʼявитися у випуску Istio. Якщо вона зʼявляється, то буде стандартно вимкнена. Для увімкнення експериментальних функцій потрібен явний прапорець або конфігурація. | Функція зобов’язана бути в основному репозиторії Istio і доступна у випусках. Вона потребує явної дії користувача для використання. Коли функція вимкнена, це не повинно впливати на стабільність системи. | В офіційних випусках Istio функція стандартно увімкнена. | Так само, як і у Beta. |
| Аудиторія             | Інші розробники, які тісно співпрацюють над функцією або доказом концепції. | Функція орієнтована на розробників і досвідчених користувачів, які зацікавлені в ранньому зворотному звʼязку. | Користувачі, які зацікавлені в наданні зворотного звʼязку щодо функцій. | Всі користувачі. |
| Повнота               | Функція має обмежені можливості. Вона може служити доказом концепції. | Деякі операції API або команди CLI можуть бути не реалізовані. API може не мати повного огляду. | Усі операції API та команди CLI повинні бути реалізовані. Тести мають бути завершеними. API пройшов ретельний огляд і вважається завершеним. | Так само, як і у Beta. |
| Документація          | Експериментальні функції позначаються як експериментальні в автогенерованій документації. | Alpha-функції позначені як альфа. Базова документація пояснює, що робить функція і як її увімкнути. | Повна документація функції публікується на istio.io, включаючи зразки, уроки та глосарій. | Так само, як і у Beta. |
| Оновлюваність         | Схема та семантика експериментальних функцій можуть змінюватися в новіших версіях без зворотної сумісності, що вимагає змін конфігурації під час оновлень. | Схема та семантика альфа-функцій можуть змінитися в наступних випусках, без гарантій збереження об’єктів конфігурації в існуючих установках Istio. | Схема та семантика можуть змінитися в наступних випусках, але при цьому буде задокументований шлях оновлення. | Тільки строго сумісні зміни дозволені в наступних випусках. |
| Тестування            | Наявність функції не повинна впливати на випущені функції. | Функція покрита юніт-тестами і інтеграційними тестами, коли функція увімкнена. Коли функція вимкнена, це не повинно погіршувати продуктивність системи. | Інтеграційні тести охоплюють крайні випадки, а також основні сценарії використання. Тести охоплюють зразки для функції. Покриття тестами >= 80%. | Повне покриття тестами з рівнем >= 90%. |
| Надійність            | Користувачі не повинні очікувати, що функція буде надійною. | Через те, що функція є відносно новою, вона може мати помилки, які дестабілізують Istio. | Функція протестована і не повинна створювати нових помилок в несуміжних функціях. | Висока. Функція добре протестована, стабільна та надійна для всіх сценаріїв. |
| Рекомендовані сценарії використання | У середовищах розробки або тестування з коротким терміном існування для отримання раннього зворотного зв’язку від користувачів. | У середовищах розробки або тестування з коротким терміном існування через складність оновлень і відсутність довгострокової підтримки. | У середовищах розробки або тестування, а також у промислових середовищах для оцінки функції та надання зворотного зв’язку. | У будь-якому середовищі. |

## Функції Istio {#istio-features}

Нижче наведено перелік наявних функцій Istio та їхні поточні фази. Ця інформація оновлюється після кожного випуску.

### Управління трафіком {#traffic-management}

{{< features section="Traffic Management" >}}

### Спостережуваність {#observability}

{{< features section="Observability" >}}

### Розширюваність {#extensibility}

{{< features section="Extensibility" >}}

### Безпека та забезпечення політики {#security-and-policy-enforcement}

{{< features section="Security and policy enforcement" >}}

### Основні функції {#core}

{{< features section="Core" >}}

### Ambient {#ambient}

{{< features section="Ambient" >}}

{{< idea >}}
Звʼяжіться з нами, [приєднавшись до нашої спільноти](/get-involved/), якщо є функції, які ви хотіли б побачити в наших майбутніх випусках!
{{< /idea >}}