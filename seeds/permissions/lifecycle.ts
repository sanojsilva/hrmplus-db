import { Permission } from "@prisma/client";

//starts from 100 - 200

const lifecyclePermissions: Partial<Permission>[] = [
  {
    id: 100,
    name: "View onboarded",
    frontendRoute: "/dashboard/lifecycle/onboarding",
    backendRoute: "",
    module: "core",
  },
  {
    id: 101,
    name: "View applicants - offer accepted",
    frontendRoute: "/dashboard/lifecycle/onboarding/applicants",
    backendRoute: "",
    module: "core",
  },
  {
    id: 102,
    name: "View onboarding details of an employee",
    frontendRoute: "/dashboard/lifecycle/onboarding/preview",
    backendRoute: "",
    module: "core",
  },
  {
    id: 103,
    name: "Create Onboarding",
    frontendRoute: "/dashboard/lifecycle/onboarding/create",
    backendRoute: "",
    module: "core",
  },
  {
    id: 104,
    name: "View Promoted Employees",
    frontendRoute: "/dashboard/lifecycle/promotion",
    backendRoute: "",
    module: "core",
  },
  {
    id: 105,
    name: "View Employee List for Promotion",
    frontendRoute: "/dashboard/lifecycle/promotion/employees",
    backendRoute: "",
    module: "core",
  },
  {
    id: 106,
    name: "View Promotion Details of an employee",
    frontendRoute: "/dashboard/lifecycle/promotion/preview",
    backendRoute: "",
    module: "core",
  },
  {
    id: 107,
    name: "Create Promotion",
    frontendRoute: "/dashboard/lifecycle/promotion/create",
    backendRoute: "",
    module: "core",
  },

  {
    id: 108,
    name: "View Seperated Employees",
    frontendRoute: "/dashboard/lifecycle/seperation",
    backendRoute: "",
    module: "core",
  },
  {
    id: 109,
    name: "View Employee List for Seperation",
    frontendRoute: "/dashboard/lifecycle/seperation/employees",
    backendRoute: "",
    module: "core",
  },
  {
    id: 110,
    name: "View Seperation Details of an employee",
    frontendRoute: "/dashboard/lifecycle/seperation/preview",
    backendRoute: "",
    module: "core",
  },
  {
    id: 111,
    name: "Create Seperation",
    frontendRoute: "/dashboard/lifecycle/seperation/create",
    backendRoute: "",
    module: "core",
  },

  {
    id: 112,
    name: "View Transfered Employees",
    frontendRoute: "/dashboard/lifecycle/transfer",
    backendRoute: "",
    module: "core",
  },
  {
    id: 113,
    name: "View Employee List for Transfer",
    frontendRoute: "/dashboard/lifecycle/transfer/employees",
    backendRoute: "",
    module: "core",
  },
  {
    id: 114,
    name: "View Transfer Details of an employee",
    frontendRoute: "/dashboard/lifecycle/transfer/preview",
    backendRoute: "",
    module: "core",
  },
  {
    id: 115,
    name: "Create Transfer",
    frontendRoute: "/dashboard/lifecycle/transfer/create",
    backendRoute: "",
    module: "core",
  },

  {
    id: 116,
    name: "View Skillmaps Employees",
    frontendRoute: "/dashboard/lifecycle/skillmap",
    backendRoute: "",
    module: "core",
  },
  {
    id: 117,
    name: "View Employee List for Skillmap",
    frontendRoute: "/dashboard/lifecycle/skillmap/employees",
    backendRoute: "",
    module: "core",
  },
  {
    id: 118,
    name: "View Skillmap Details of an employee",
    frontendRoute: "/dashboard/lifecycle/skillmap/preview",
    backendRoute: "",
    module: "core",
  },
  {
    id: 119,
    name: "Create Skillmap",
    frontendRoute: "/dashboard/lifecycle/skillmap/create",
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
    frontendRoute: "/dashboard/lifecycle/lifecycle-history",
    backendRoute: "",
    module: "core",
  },
];

export default lifecyclePermissions;
