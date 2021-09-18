import { Permission } from "@prisma/client";

//starts from 800 - 900

const trainingRoutes: Partial<Permission>[] = [
  {
    id: 800,
    name: "Create Training Event",
    frontendRoute: "/dashboard/training/create-training-event",
    backendRoute: "",
    module: "core",
  },
  {
    id: 801,
    name: "View Training Events",
    frontendRoute: "/dashboard/training/training-events",
    backendRoute: "",
    module: "core",
  },
  {
    id: 802,
    name: "Create Training Result",
    frontendRoute: "/dashboard/training/create-training-result",
    backendRoute: "",
    module: "core",
  },
  {
    id: 803,
    name: "View Training Results",
    frontendRoute: "/dashboard/training/training-results",
    backendRoute: "",
    module: "core",
  },
];

export default trainingRoutes;
