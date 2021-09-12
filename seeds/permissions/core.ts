import { Permission } from "@prisma/client";

//starts from 200 - 300

const coreRoutes: Partial<Permission>[] = [
  {
    id: 200,
    name: "View Employees",
    frontendRoute: "/dashboard/core/employees",
    backendRoute: "",
    module: "core",
  },
  {
    id: 201,
    name: "Create Employee",
    frontendRoute: "/dashboard/core/employee/create",
    backendRoute: "",
    module: "core",
  },
  {
    id: 202,
    name: "View Designations",
    frontendRoute: "/dashboard/core/designations",
    backendRoute: "",
    module: "core",
  },
  {
    id: 203,
    name: "Create Designation",
    frontendRoute: "/dashboard/core/designation/create",
    backendRoute: "",
    module: "core",
  },
  {
    id: 204,
    name: "View Departments",
    frontendRoute: "/dashboard/core/departments",
    backendRoute: "",
    module: "core",
  },
  {
    id: 205,
    name: "Create Department",
    frontendRoute: "/dashboard/core/department/create",
    backendRoute: "",
    module: "core",
  },
  {
    id: 206,
    name: "View Company",
    frontendRoute: "/dashboard/core/company",
    backendRoute: "",
    module: "core",
  },
  {
    id: 207,
    name: "Edit Company",
    frontendRoute: "/dashboard/core/company/edit-company-basic/:id",
    backendRoute: "",
    module: "core",
  },
  {
    id: 204,
    name: "View Employment Types",
    frontendRoute: "/dashboard/core/employment-types",
    backendRoute: "",
    module: "core",
  },
  {
    id: 205,
    name: "Create Employment Type",
    frontendRoute: "/dashboard/core/create-employment-type",
    backendRoute: "",
    module: "core",
  },
];

export default coreRoutes;
