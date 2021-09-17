import { PrismaClient } from "@prisma/client";
import company from "./seeds/company";
import departments from "./seeds/departments";
import designations from "./seeds/designations";
import employees from "./seeds/employees";
import authPermissions from "./seeds/permissions/auth";
import leavePermissions from "./seeds/permissions/leave";
import coreRoutes from "./seeds/permissions/core";
import lifecyclePermissions from "./seeds/permissions/lifecycle";
import recruitmentPermissions from "./seeds/permissions/recruitment";
import roles from "./seeds/roles";
import users from "./seeds/users";
import holidayLists from "./seeds/holidaylists";
import userRoles from "./seeds/userRoles";
import rolePermissions from "./seeds/rolePermissions";
import grade from "./seeds/grade";
import performancePermissions from "./seeds/permissions/performance";
import offerTerms from "./seeds/offerTerms";
import attendanceRoutes from "./seeds/permissions/attendance";
import shiftRoutes from "./seeds/permissions/shift";
import trainingRoutes from "./seeds/permissions/training";
import onboardingActs from "./seeds/onboardingActivities";
import seperationActs from "./seeds/seperationActivities";
import skills from "./seeds/skills";
import skillsofDes from "./seeds/skillsofdesignation";
const db = new PrismaClient();

async function main() {
  //1-100
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

  //100-200
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

  //300-400
  for (const permission of recruitmentPermissions) {
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

  //400-500
  for (const permission of leavePermissions) {
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

  //500-600
  for (const permission of performancePermissions) {
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

  //200-300
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

  //600-700
  for (const permission of attendanceRoutes) {
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

  //700-800
  for (const permission of shiftRoutes) {
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

  //800-900
  for (const permission of trainingRoutes) {
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

  for (const gr of grade) {
    await db.grade.upsert({
      where: {
        id: gr.id,
      },
      //@ts-ignore
      create: {
        ...gr,
      },
      update: {
        ...gr,
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

  for (const hl of holidayLists) {
    await db.holidayList.upsert({
      where: {
        id: hl.id,
      },
      create: {
        ...hl,
      },
      update: {
        ...hl,
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
  for (const user of users) {
    await db.user.upsert({
      where: {
        id: user.id,
      },
      create: {
        ...user,
      },
      update: {
        ...user,
      },
    });
  }

  for (const userRole of userRoles) {
    await db.userRoles.upsert({
      where: {
        roleId_userId: {
          userId: userRole.userId,
          roleId: userRole.roleId,
        },
      },
      create: {
        ...userRole,
      },
      update: {
        ...userRole,
      },
    });
  }

  for (const rolePermission of rolePermissions) {
    await db.rolePermissions.upsert({
      where: {
        roleId_permissionId: {
          permissionId: rolePermission.permissionId,
          roleId: rolePermission.roleId,
        },
      },
      create: {
        ...rolePermission,
      },
      update: {
        ...rolePermission,
      },
    });
  }

  for (const term of offerTerms) {
    await db.offerTerm.upsert({
      where: {
        id: term.id,
      },
      //@ts-ignore
      create: {
        ...term,
      },
      update: {
        ...term,
      },
    });
  }

  for (const term of onboardingActs) {
    await db.onboardingActivities.upsert({
      where: {
        id: term.id,
      },
      //@ts-ignore
      create: {
        ...term,
      },
      update: {
        ...term,
      },
    });
  }

  for (const term of seperationActs) {
    await db.seperationActivities.upsert({
      where: {
        id: term.id,
      },
      //@ts-ignore
      create: {
        ...term,
      },
      update: {
        ...term,
      },
    });
  }

  for (const term of skills) {
    await db.skills.upsert({
      where: {
        id: term.id,
      },
      //@ts-ignore
      create: {
        ...term,
      },
      update: {
        ...term,
      },
    });
  }

  for (const term of skillsofDes) {
    await db.skillsOfDesignation.upsert({
      where: {
        id: term.id,
      },
      //@ts-ignore
      create: {
        ...term,
      },
      update: {
        ...term,
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
