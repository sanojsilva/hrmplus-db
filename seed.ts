import { PrismaClient } from "@prisma/client";
import company from "./seeds/company";
import departments from "./seeds/departments";
import designations from "./seeds/designations";
import employees from "./seeds/employees";
import authPermissions from "./seeds/permissions/auth";
import coreRoutes from "./seeds/permissions/core";
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

  for (const permission of coreRoutes) {
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

  for (const dept of departments) {
    await db.department.upsert({
      where: {
        id: dept.id,
      },
      create: {
        ...dept,
      },
      update: {
        ...dept,
      },
    });
  }

  for (const des of designations) {
    await db.designation.upsert({
      where: {
        id: des.id,
      },
      create: {
        ...des,
      },
      update: {
        ...des,
      },
    });
  }

  await db.company.upsert({
    where: {
      id: company.id,
    },
    create: {
      ...company,
    },
    update: {
      ...company,
    },
  });

  for (const emp of employees) {
    await db.employee.upsert({
      where: {
        id: emp.id,
      },
      //@ts-ignore
      create: {
        ...emp,
      },
      //@ts-ignore
      update: {
        ...emp,
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
