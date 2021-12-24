# Пример авторизации

Комментарии к коду доступны [здесь](https://cloud.mail.ru/public/41zp/5a1sPMB8L) и [вот здесь](https://cloud.mail.ru/public/5f9q/3P1anG33Z).

Важным дополнением, которое было обещано на семинаре, но не было рассмотрено, является добавление авторства поста.

У нас есть два ресурса - посты и пользователи. И пока что они никак не связаны друг с другом. Чтобы у поста появился автор, необходимо с точки зрения БД добавить внешний ключ `user_id`. Рассмотрим этот процесс в деталях:

1. Нужна миграция, потому что мы хотим менять колонку в БД. Миграцию можно добавить так `rails g migration add_user_to_posts user:references`. **Название миграции имеет значение**, потому что мы только пишем, что нам нужен внешний ключ на пользователя (`user:references`), а куда его добавить - нет. Это рельса за нас понимает сама. Нужно также обратить внимание, что в миграции по умолчанию будет `add_reference :posts, :user, null: true, foreign_key: true` - **`null: true`**. Если пустая база, то можно не обращать внимание, но если в базе есть посты, то мигнация не накатится - **замените на `null: false`**.
2. Нужно связать модели друг с другом. На 1 шаге мы связали таблицы в БД, теперь нужно сообщить нашей ORM, что модели связаны. Это делается не только из-за того, что нахождение связей между моделями может быть не очень тривиальным, но и для того, чтобы больше развязать руки программисту, и он мог хранить в моделях только те методы (связи иными словами), которые ему нужны - без лишнего мусора. Связи такие: той модели, которая содержит `foreign_key`, нужно добавить `belongs_to :user` (в нашем случае `:user`), а той, на которую внешний ключ - `has_many :posts`. Названия того, куда `belongs_to` и чего `has_many` образуются из названия соответствующей модели. Теперь у `current_user` есть метод `posts`, а у поста - метод `user`, которые дают полный список постов и модель автора соответственно.
3. Нужно добавлять автора к посту. Делать это можно разными способами, можно, к примеру, добавлять к `post_params` id автора, но я бы рекомендовал жестко ограничить количество мест, где меняется внешний ключ (по идее он меняется только при создании) и явно его прописать: `@post = Post.new(**post_params, user_id: current_user.id)`. `post_params` - это хэш, и `Post.new` также принимает на вход хэш. Пока мы писали `Post.new(post_params)`, все было ок, но теперь нужно объединить два хэша - тот, что прислал пользователь, и внешний ключ на автора `{ user_id: current_user.id }`. Для этого применяется т.н. "распаковка" хэша - если `post_params = { title: 'title', text: 'text' }`, то `Post.new(**post_params, user_id: current_user.id)` - это то же самое, что `Post.new(title: 'title', text: 'text', user_id: current_user.id)`