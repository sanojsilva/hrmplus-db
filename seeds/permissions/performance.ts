import { Permission } from "@prisma/client";

//starts from 500 - 600

const performancePermissions: Partial<Permission>[] = [
  {
    id: 500,
    name: "Create Responsibility",
    frontendRoute: "/dashboard/performance/create-responsibility",
    backendRoute: "",
    module: "core",
  },
  {
    id: 501,
    name: "View Responsibilities",
    frontendRoute: "/dashboard/performance/view-responsibilities",
    backendRoute: "",
    module: "core",
  },
  {
    id: 502,
    name: "View Responsibility Allcocations",
    frontendRoute: "/dashboard/performance/assign-responsibilities",
    backendRoute: "/auth/users/view-all",
    module: "core",
  },
  {
    id: 503,
    name: "View Responsibility History of Employee",
    frontendRoute: "/dashboard/performance/view-responsibility-history",
    backendRoute: "",
    module: "core",
  },
  {
    id: 504,
    name: "Create Responsibility Template",
    frontendRoute: "/dashboard/performance/create-responsibility-template",
    backendRoute: "",
    module: "core",
  },
  {
    id: 505,
    name: "View Responsibility Templates",
    frontendRoute: "/dashboard/performance/responsibility-templates",
    backendRoute: "",
    module: "core",
  },
  {
    id: 506,
    name: "Create Responsibility Allocation",
    frontendRoute: "/dashboard/performance/create-responsibility-allocation",
    backendRoute: "",
    module: "core",
  },
];

export default performancePermissions;
