# Usage Guide

This package provides TypeScript definitions and runtime code for Raccoon protobuf schemas.

## Installation

```bash
npm install @raccoonai/proto-schema
```

## TypeScript Usage

### Import Messages

```typescript
import { raccoonai } from "@raccoonai/proto-schema";

// Create a new User
const user = raccoonai.User.create({
  id: 1,
  createdAt: { seconds: Date.now() / 1000, nanos: 0 },
  role: raccoonai.UserRole.USER_ROLE_ADMIN,
  firstName: "John",
  lastName: "Doe",
  email: "john@example.com",
  status: raccoonai.UserStatus.USER_STATUS_ACTIVE,
});

// Encode to binary
const buffer = raccoonai.User.encode(user).finish();

// Decode from binary
const decodedUser = raccoonai.User.decode(buffer);

// Convert to plain object
const plainObject = raccoonai.User.toObject(user);

// Verify message
const error = raccoonai.User.verify(user);
if (error) {
  console.error("Verification failed:", error);
}
```

### Working with Enums

```typescript
import { raccoonai } from "@raccoonai/proto-schema";

// Use enum values
const adminRole = raccoonai.UserRole.USER_ROLE_ADMIN;
const activeStatus = raccoonai.UserStatus.USER_STATUS_ACTIVE;

// Get enum name from value
const roleName = raccoonai.UserRole[adminRole]; // "USER_ROLE_ADMIN"
```

### Type-safe Interfaces

```typescript
import { raccoonai } from "@raccoonai/proto-schema";

// Use interfaces for type checking
function createUser(userData: raccoonai.IUser): raccoonai.User {
  return raccoonai.User.create(userData);
}

function processUserUpdate(update: raccoonai.IUserUpdate): void {
  // Process update...
}
```

## JavaScript Usage

```javascript
const { raccoonai } = require("@raccoonai/proto-schema");

// Create and encode a message
const truck = raccoonai.Truck.create({
  id: 123,
  registrationNumber: "ABC-123",
  ownerOrganizationId: 456,
});

const buffer = raccoonai.Truck.encode(truck).finish();
```

## gRPC Usage

If you're using gRPC, you can still use the original `.proto` files which are included in the package:

```typescript
import * as grpc from "@grpc/grpc-js";
import * as protoLoader from "@grpc/proto-loader";
import path from "path";

const PROTO_PATH = path.join(
  __dirname,
  "node_modules",
  "@raccoonai",
  "proto-schema",
  "user_service.proto",
);

const packageDefinition = protoLoader.loadSync(PROTO_PATH, {
  keepCase: true,
  longs: String,
  enums: String,
  defaults: true,
  oneofs: true,
});

const protoDescriptor = grpc.loadPackageDefinition(packageDefinition);
```

## Available Messages

All message types are available under the `raccoonai` namespace:

- `User`, `UserCreate`, `UserUpdate`, `UserRole`, `UserStatus`
- `Organization`, `OrganizationSettings`
- `Truck`, `TruckIncident`
- `Job`, `Route`, `ShiftPlan`
- `Container`, `Location`, `PickupLocation`
- `Contract`, `CostProvider`
- `ChatSession`, `Notification`
- `AuditLog`, `Analytics`
- And more...

## Proto Files

All original `.proto` files are included in the package and can be found at:

```
node_modules/@raccoonai/proto-schema/*.proto
```

## Development

To rebuild the TypeScript files from proto sources:

```bash
npm run build
```

This will:

1. Clean the `dist/` and `generated/` directories
2. Generate TypeScript definitions from all `.proto` files
3. Compile TypeScript to JavaScript
