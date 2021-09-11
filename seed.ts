import { PrismaClient } from "@prisma/client";
import authPermissions from "./permissions/auth";
const db = new PrismaClient();

async function main() {
  for (const permission of authPermissions) {
    await db.permission.upsert({
      where: {
        code: permission.code,
      },
      update: {
        ...permission,
      },
      //@ts-ignore
      create: {
        ...permission,
      },
    });
  }
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await db.$disconnect();
  });
