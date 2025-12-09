# Protobuf schemas

Used to define the structure of the data exchanged between **Raccoon** services.

## Установка

Этот пакет публикуется в GitHub Packages. Для установки необходимо настроить доступ к GitHub Packages registry.

### Настройка .npmrc

Создайте или обновите файл `.npmrc` в корне вашего проекта:

```text
@raccoonai:registry=https://npm.pkg.github.com
//npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}
```

Для локальной разработки создайте `.npmrc` в домашней директории (`~/.npmrc`) или в корне проекта с вашим персональным токеном:

```text
@raccoonai:registry=https://npm.pkg.github.com
//npm.pkg.github.com/:_authToken=YOUR_GITHUB_TOKEN
```

### Установка пакета

```bash
npm install @raccoonai/proto-schema
```

или с указанием версии:

```bash
npm install @raccoonai/proto-schema@1.0.0
```

## Использование

После установки, `.proto` файлы будут доступны в `node_modules/@raccoonai/proto-schema/`.

### Пример для фронтенда

```javascript
// Импорт proto файлов для использования с protobuf.js или другими библиотеками
import { protoFiles } from "@raccoonai/proto-schema";
```

### Пример для бэкенда (Node.js)

```javascript
const path = require("path");
const protoPath = path.join(
  __dirname,
  "node_modules",
  "@raccoonai",
  "proto-schema",
);
// Используйте protoPath для загрузки .proto файлов
```

### Пример для Go

```go
import (
    "path/filepath"
    "os"
)

protoDir := filepath.Join("node_modules", "@raccoonai", "proto-schema")
// Используйте protoDir для компиляции proto файлов
```

## Публикация новой версии

Публикация происходит автоматически через GitHub Actions при создании тега:

```bash
git tag v1.0.1
git push origin v1.0.1
```

Или вручную через GitHub Actions workflow "Publish to GitHub Packages".

## Миграция с git submodule

Если вы ранее использовали этот репозиторий как git submodule:

1. Удалите submodule из вашего проекта:

   ```bash
   git submodule deinit -f proto_schema
   git rm proto_schema
   ```

2. Установите пакет через npm:

   ```bash
   npm install @raccoonai/proto-schema
   ```

3. Обновите пути к proto файлам в вашем коде (если необходимо)
