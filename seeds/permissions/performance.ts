import { Permission } from "@prisma/client";

//starts from 500 - 600

const performancePermissions: Partial<Permission>[] = [
  {
    id: 500,
    name: "Create Responsibility",
    frontendRoute: "/dashboard/performance/create-responsibility",
    backendRoute: "",
    module: "performance",
  },
  {
    id: 501,
    name: "View Responsibilities",
    frontendRoute: "/dashboard/performance/view-responsibilities",
    backendRoute: "",
    module: "performance",
  },
  {
    id: 502,
    name: "View Responsibility Allcocations",
    frontendRoute: "/dashboard/performance/assign-responsibilities",
    backendRoute: "/auth/users/view-all",
    module: "performance",
  },
  {
    id: 503,
    name: "View Responsibility History of Employee",
    frontendRoute: "/dashboard/performance/view-responsibility-history",
    backendRoute: "",
    module: "performance",
  },
  {
    id: 504,
    name: "Create Responsibility Template",
    frontendRoute: "/dashboard/performance/create-responsibility-template",
    backendRoute: "",
    module: "performance",
  },
  {
    id: 505,
    name: "View Responsibility Templates",
    frontendRoute: "/dashboard/performance/responsibility-templates",
    backendRoute: "",
    module: "performance",
  },
  {
    id: 506,
    name: "Create Responsibility Allocation",
    frontendRoute: "/dashboard/performance/create-responsibility-allocation",
    backendRoute: "",
    module: "performance",
  },
  {
    id: 507,
    name: "My Responsibilities",
    frontendRoute: "/dashboard/performance/my-responsibilities",
    backendRoute: "",
    module: "performance",
  },
];

export default performancePermissions;
