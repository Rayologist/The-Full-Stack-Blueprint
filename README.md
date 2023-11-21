# full-stack-blueprint

## Backend

### Init package.json

```bash
pnpm init
```

### Dependencies

```bash
pnpm install bcryptjs cors dotenv express pg && pnpm install -D @types/bcryptjs @types/cors @types/express @types/pg nodemon ts-node typescript

```

### Init tsconfig.json

```bash
pnpm tsc --init
```

### Scripts

```json
{
    "scripts": {
        "dev": "nodemon -r dotenv/config src/index.ts",
        "build": "tsc --outDir dist",
        "start": "node -r dotenv/config dist/index.js"
    }
}
```

### Types

```typescript
type User = {
  id: number;
  email: string;
  password: string;
  firstName: string;
  lastName: string;
  createdAt: Date;
  updatedAt: Date;
};

```

### Create env file

```bash
POSTGRES_USER=
POSTGRES_PASSWORD=
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
```

### Connect to Database

```typescript
if (!process.env.POSTGRES_HOST || !process.env.POSTGRES_PORT || !process.env.POSTGRES_USER || !process.env.POSTGRES_PASSWORD) {
  throw new Error("Missing required environment variables");
}

const db = new Pool({
  host: process.env.POSTGRES_HOST,
  port: parseInt(process.env.POSTGRES_PORT),
  user: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
  database: process.env.POSTGRES_USER,
});
```
