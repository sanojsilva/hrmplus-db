import { Permission } from "@prisma/client";

//starts from 700 - 800

const shiftRoutes: Partial<Permission>[] = [
  {
    id: 700,
    name: "View Shift Types",
    frontendRoute: "/dashboard/shift/shift-types",
    backendRoute: "",
    module: "core",
  },
  {
    id: 701,
    name: "Create Shift Types",
    frontendRoute: "/dashboard/shift/create-shift-types",
    backendRoute: "",
    module: "core",
  },
  {
    id: 702,
    name: "Edit Shift Types",
    frontendRoute: "/dashboard/shift/edit-shift-types/:id",
    backendRoute: "",
    module: "core",
  },
  {
    id: 703,
    name: "View Shift Calendar",
    frontendRoute: "/dashboard/shift/shift-plan/:id",
    backendRoute: "",
    module: "core",
  },
  {
    id: 704,
    name: "View Shift Requests",
    frontendRoute: "/dashboard/shift/shift-request",
    backendRoute: "",
    module: "core",
  },
  {
    id: 705,
    name: "Create Shift Requests",
    frontendRoute: "/dashboard/shift/create-shift-request",
    backendRoute: "",
    module: "core",
  },
  {
    id: 706,
    name: "View Shift Allocation",
    frontendRoute: "/dashboard/shift/shift-allocationy",
    backendRoute: "",
    module: "core",
  },
  {
    id: 707,
    name: "Create Shift Allocation",
    frontendRoute: "/dashboard/core/company/edit-company-basic/:id",
    backendRoute: "",
    module: "core",
  },
  {
    id: 708,
    name: "Edit Shift Allocation",
    frontendRoute: "/dashboard/shift/edit-shift-allocation/:id",
    backendRoute: "",
    module: "core",
  },
];

export default shiftRoutes;
