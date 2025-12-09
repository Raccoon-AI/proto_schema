# Protobuf Schemas

Used to define the structure of the data exchanged between Raccoon services.

## Installation

This package is published to GitHub Packages. To install it, you need to configure access to the GitHub Packages registry.

## Configuring .npmrc

Create or update the .npmrc file in the root of your project:

```
@raccoonai:registry=https://npm.pkg.github.com
//npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}
```

For local development, create a .npmrc file in your home directory (~/.npmrc) or in the project root with your personal token:

```
@raccoonai:registry=https://npm.pkg.github.com
//npm.pkg.github.com/:_authToken=YOUR_GITHUB_TOKEN

```

### Package Installation

```bash
npm install @raccoonai/proto-schema
```

or by specifying the version:

```bash
npm install @raccoonai/proto-schema@1.0.0
```

## Usage

After installation, the .proto files will be available in node_modules/@raccoonai/proto-schema/.

### Frontend Example

```javascript
// Import proto files for use with protobuf.js or other libraries
import { protoFiles } from "@raccoonai/proto-schema";
```

### Backend (Node.js) Example

```javascript
const path = require("path");
const protoPath = path.join(
  __dirname,
  "node_modules",
  "@raccoonai",
  "proto-schema",
);
// Use protoPath to load .proto files
```

### Go Example

```go

import (
"path/filepath"
"os"
)

protoDir := filepath.Join("node_modules", "@raccoonai", "proto-schema")
// Use protoDir to compile proto files
```

## Publishing a New Version

Publishing happens automatically via GitHub Actions upon creation of a tag:

```bash
git tag v1.0.1
git push origin v1.0.1
```

Or manually via the "Publish to GitHub Packages" GitHub Actions workflow.

## Migration from Git Submodule

If you previously used this repository as a git submodule:

1. Remove the submodule from your project:

   ```bash
   git submodule deinit -f proto_schema
   git rm proto_schema
   ```

2. Install the package via npm:

   ```bash
   npm install @raccoonai/proto-schema
   ```

3. Update the paths to the proto files in your code (if necessary).
