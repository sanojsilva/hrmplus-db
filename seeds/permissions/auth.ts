import { Permission } from "@prisma/client";

//starts from 1 - 100

const authPermissions: Partial<Permission>[] = [
  {
    id: 1,
    name: "Login",
    frontendRoute: "/dashboard/login",
    backendRoute: "/auth/login",
    module: "auth",
  },
  {
    id: 2,
    name: "View Users",
    frontendRoute: "/dashboard/core/auth/users",
    backendRoute: "/auth/users/view-all",
    module: "auth",
  },
  {
    id: 3,
    name: "Create User",
    frontendRoute: "/dashboard/core/auth/create-user",
    backendRoute: "/auth/create-user",
    module: "auth",
  },
  {
    id: 4,
    name: "View Roles",
    frontendRoute: "/dashboard/core/auth/roles",
    backendRoute: "/auth/roles/view-all",
    module: "auth",
  },
  {
    id: 5,
    name: "Create Role",
    frontendRoute: "/dashboard/core/auth/create-role",
    backendRoute: "/auth/create-role",
    module: "auth",
  },
  {
    id: 6,
    name: "Assign Role Permissions",
    frontendRoute: "/dashboard/core/auth/assign-role-permissions",
    backendRoute: "/auth/roles/assign-permissions",
    module: "auth",
  },
];

export default authPermissions;
