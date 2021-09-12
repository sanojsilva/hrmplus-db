import { Permission } from "@prisma/client";

//starts from 100 - 200

const lifecyclePermissions: Partial<Permission>[] = [
  {
    id: 100,
    name: "View onboarded",
    frontendRoute: "/dashboard/core/lifecycle/onboarding",
    backendRoute: "",
    module: "core",
  },
  {
    id: 101,
    name: "View applicants - offer accepted",
    frontendRoute: "/dashboard/core/lifecycle/onboarding/applicants",
    backendRoute: "",
    module: "core",
  },
  {
    id: 102,
    name: "View onboarding details of an employee",
    frontendRoute: "/dashboard/core/lifecycle/onboarding/preview",
    backendRoute: "",
    module: "core",
  },
  {
    id: 103,
    name: "Create Onboarding",
    frontendRoute: "/dashboard/core/lifecycle/onboarding/create",
    backendRoute: "",
    module: "core",
  },
  {
    id: 104,
    name: "View Promoted Employees",
    frontendRoute: "/dashboard/core/lifecycle/promotion",
    backendRoute: "",
    module: "core",
  },
  {
    id: 105,
    name: "View Employee List for Promotion",
    frontendRoute: "/dashboard/core/lifecycle/promotion/employees",
    backendRoute: "",
    module: "core",
  },
  {
    id: 106,
    name: "View Promotion Details of an employee",
    frontendRoute: "/dashboard/core/lifecycle/promotion/preview",
    backendRoute: "",
    module: "core",
  },
  {
    id: 107,
    name: "Create Promotion",
    frontendRoute: "/dashboard/core/lifecycle/promotion/create",
    backendRoute: "",
    module: "core",
  },

  {
    id: 108,
    name: "View Seperated Employees",
    frontendRoute: "/dashboard/core/lifecycle/seperation",
    backendRoute: "",
    module: "core",
  },
  {
    id: 109,
    name: "View Employee List for Seperation",
    frontendRoute: "/dashboard/core/lifecycle/seperation/employees",
    backendRoute: "",
    module: "core",
  },
  {
    id: 110,
    name: "View Seperation Details of an employee",
    frontendRoute: "/dashboard/core/lifecycle/seperation/preview",
    backendRoute: "",
    module: "core",
  },
  {
    id: 111,
    name: "Create Seperation",
    frontendRoute: "/dashboard/core/lifecycle/seperation/create",
    backendRoute: "",
    module: "core",
  },

  {
    id: 112,
    name: "View Transfered Employees",
    frontendRoute: "/dashboard/core/lifecycle/transfer",
    backendRoute: "",
    module: "core",
  },
  {
    id: 113,
    name: "View Employee List for Transfer",
    frontendRoute: "/dashboard/core/lifecycle/transfer/employees",
    backendRoute: "",
    module: "core",
  },
  {
    id: 114,
    name: "View Transfer Details of an employee",
    frontendRoute: "/dashboard/core/lifecycle/transfer/preview",
    backendRoute: "",
    module: "core",
  },
  {
    id: 115,
    name: "Create Transfer",
    frontendRoute: "/dashboard/core/lifecycle/transfer/create",
    backendRoute: "",
    module: "core",
  },

  {
    id: 116,
    name: "View Skillmaps Employees",
    frontendRoute: "/dashboard/core/lifecycle/skillmap",
    backendRoute: "",
    module: "core",
  },
  {
    id: 117,
    name: "View Employee List for Skillmap",
    frontendRoute: "/dashboard/core/lifecycle/skillmap/employees",
    backendRoute: "",
    module: "core",
  },
  {
    id: 118,
    name: "View Skillmap Details of an employee",
    frontendRoute: "/dashboard/core/lifecycle/skillmap/preview",
    backendRoute: "",
    module: "core",
  },
  {
    id: 119,
    name: "Create Skillmap",
    frontendRoute: "/dashboard/core/lifecycle/skillmap/create",
    backendRoute: "",
    module: "core",
  },
  {
    id: 120,
    name: "View Lifecycle Reports Page",
    frontendRoute: "/dashboard/lifecycle/reports",
    backendRoute: "",
    module: "core",
  },
  {
    id: 121,
    name: "View Lifecycle History",
    frontendRoute: "/dashboard/core/lifecycle/lifecycle-history",
    backendRoute: "",
    module: "core",
  },
];

export default lifecyclePermissions;
