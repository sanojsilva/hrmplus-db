import { Permission } from "@prisma/client";

//starts from 300 - 400

const recruitmentPermissions: Partial<Permission>[] = [
  {
    id: 300,
    name: "View Staffing Plans",
    frontendRoute: "/dashboard/recruitment/staffing-plans",
    backendRoute: "",
    module: "recruitment",
  },
  {
    id: 301,
    name: "Create Staffing Plan",
    frontendRoute: "/dashboard/recruitment/create-staffing-plan",
    backendRoute: "",
    module: "recruitment",
  },
  {
    id: 302,
    name: "View Job Applicants",
    frontendRoute: "/dashboard/recruitment/job-applicants",
    backendRoute: "",
    module: "recruitment",
  },
  {
    id: 303,
    name: "View ALl Appointment Letters",
    frontendRoute: "/dashboard/recruitment/appointment-letters",
    backendRoute: "",
    module: "recruitment",
  },
  {
    id: 304,
    name: "View Appointment Letter Preview",
    frontendRoute: "/dashboard/recruitment/appointment-letters/preview",
    backendRoute: "/dashboard/recruitment/create-role",
    module: "recruitment",
  },
  {
    id: 305,
    name: "Create Appointment Letter",
    frontendRoute: "/dashboard/recruitment/create-appointment-letter",
    backendRoute: "",
    module: "recruitment",
  },
  {
    id: 306,
    name: "View Job Offers",
    frontendRoute: "/dashboard/recruitment/job-offers",
    backendRoute: "",
    module: "recruitment",
  },
  {
    id: 307,
    name: "Create Job Offer",
    frontendRoute: "/dashboard/recruitment/create-job-offer",
    backendRoute: "",
    module: "recruitment",
  },
  {
    id: 308,
    name: "Create Job Opening",
    frontendRoute: "/dashboard/recruitment/create-job-opening",
    backendRoute: "",
    module: "recruitment",
  },
  {
    id: 309,
    name: "View All Job Openings",
    frontendRoute: "/dashboard/recruitment/create-appointment-letter",
    backendRoute: "",
    module: "recruitment",
  },
];

export default recruitmentPermissions;
