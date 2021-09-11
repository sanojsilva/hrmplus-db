import { PrismaClient } from "@prisma/client";
import authPermissions from "./seeds/permissions/auth";
import lifecyclePermissions from "./seeds/permissions/lifecycle";
import roles from "./seeds/roles";
const db = new PrismaClient();

async function main() {
  for (const permission of authPermissions) {
    await db.permission.upsert({
      where: {
        id: permission.id,
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

  for (const permission of lifecyclePermissions) {
    await db.permission.upsert({
      where: {
        id: permission.id,
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

  for (const rl of roles) {
    await db.role.upsert({
      where: {
        id: rl.id,
      },
      update: {
        name: rl.name || "",
      },
      create: {
        name: rl.name || "",
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
