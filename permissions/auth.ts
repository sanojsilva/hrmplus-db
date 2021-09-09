import { Permission } from "@prisma/client";

const authPermissions: Partial<Permission>[] = [
  {
    code: "A1",
    name: "Login",
    frontendRoute: "/dashboard/login",
    backendRoute: "/auth/login",
    module: "auth",
  },
  {
    code: "A2",
    name: "View Users",
    frontendRoute: "/dashboard/core/auth/users",
    backendRoute: "/auth/users/view-all",
    module: "auth",
  },
  {
    code: "A3",
    name: "Create User",
    frontendRoute: "/dashboard/core/auth/create-user",
    backendRoute: "/auth/create-user",
    module: "auth",
  },
  {
    code: "A4",
    name: "View Roles",
    frontendRoute: "/dashboard/core/auth/roles",
    backendRoute: "/auth/roles/view-all",
    module: "auth",
  },
  {
    code: "A5",
    name: "Create Role",
    frontendRoute: "/dashboard/core/auth/create-role",
    backendRoute: "/auth/create-role",
    module: "auth",
  },
  {
    code: "A6",
    name: "Assign Role Permissions",
    frontendRoute: "/dashboard/core/auth/assign-role-permissions",
    backendRoute: "/auth/roles/assign-permissions",
    module: "auth",
  },
];

export default authPermissions;
