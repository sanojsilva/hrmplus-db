import { Permission } from "@prisma/client";

//starts from 700 - 800

const shiftRoutes: Partial<Permission>[] = [
  {
    id: 700,
    name: "View Shift Types",
    frontendRoute: "/dashboard/shift/shift-types",
    backendRoute: "",
    module: "shift",
  },
  {
    id: 701,
    name: "Create Shift Types",
    frontendRoute: "/dashboard/shift/create-shift-types",
    backendRoute: "",
    module: "shift",
  },
  {
    id: 702,
    name: "Edit Shift Types",
    frontendRoute: "/dashboard/shift/edit-shift-types/:id",
    backendRoute: "",
    module: "shift",
  },
  {
    id: 703,
    name: "View Shift Calendar",
    frontendRoute: "/dashboard/shift/shift-plan/:id",
    backendRoute: "",
    module: "shift",
  },
  {
    id: 704,
    name: "View Shift Requests",
    frontendRoute: "/dashboard/shift/shift-request",
    backendRoute: "",
    module: "shift",
  },
  {
    id: 705,
    name: "Create Shift Requests",
    frontendRoute: "/dashboard/shift/create-shift-request",
    backendRoute: "",
    module: "shift",
  },
  {
    id: 706,
    name: "View Shift Allocation",
    frontendRoute: "/dashboard/shift/shift-allocation",
    backendRoute: "",
    module: "shift",
  },
  {
    id: 707,
    name: "Create Shift Allocation",
    frontendRoute: "/dashboard/shift/company/edit-company-basic/:id",
    backendRoute: "",
    module: "shift",
  },
  {
    id: 708,
    name: "Edit Shift Allocation",
    frontendRoute: "/dashboard/shift/edit-shift-allocation/:id",
    backendRoute: "",
    module: "shift",
  },
  {
    id: 709,
    name: "My Shift Plan",
    frontendRoute: "/dashboard/shift/shift-plan/:id",
    backendRoute: "",
    module: "shift",
  },
];

export default shiftRoutes;
