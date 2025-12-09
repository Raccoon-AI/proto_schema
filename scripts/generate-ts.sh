#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROTO_DIR="$SCRIPT_DIR/.."
OUTPUT_DIR="$PROTO_DIR/generated"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Get all .proto files
PROTO_FILES=$(find "$PROTO_DIR" -maxdepth 1 -name "*.proto" | sort)
PROTO_COUNT=$(echo "$PROTO_FILES" | wc -l)

echo "Found $PROTO_COUNT proto files"

# Convert to space-separated list for pbjs
PROTO_LIST=$(echo "$PROTO_FILES" | tr '\n' ' ')

# Generate static TypeScript code using protobufjs-cli
echo "Generating JavaScript code..."
npx pbjs -t static-module -w es6 --es6 -o "$OUTPUT_DIR/proto.js" $PROTO_LIST

echo "Generating TypeScript definitions..."
npx pbts -o "$OUTPUT_DIR/proto.d.ts" "$OUTPUT_DIR/proto.js"

# Create an index file that exports everything
echo "Creating index.ts..."
cat > "$OUTPUT_DIR/index.ts" << 'EOF'
export * from './proto';
EOF

echo "Successfully generated TypeScript files"
