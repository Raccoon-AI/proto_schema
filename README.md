# Protobuf schemas

Used to define the structure of the data exchanged between **RaccoonAI** services.

Conventions:

- Each service has its own `.proto` file, located in the `proto_schema` directory.
- The file name should be in the format `<service_name>.proto`, where `<service_name>` is the name of the service (e.g., `user_service.proto`).
- Don't use `ID` for field names and RPC names, but `Id`.
- Use `snake_case` for field names, and `PascalCase` for message names.
- For fields like `created_at` and `updated_at`, use `google.protobuf.Timestamp` type, and start their field numbers from 101 to avoid conflicts with other fields.
- For frontend facing RPC methods, the requests must check if organization should be included in the request, and if so, it should be used to scope the data access. This is to ensure that users can only access data that belongs to their organization.
- For `repeated` fields use plural naming
