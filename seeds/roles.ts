import { Role } from "@prisma/client";

const roles: Partial<Role>[] = [
  {
    id: 1,
    name: "Operational Employee",
  },
  {
    id: 2,
    name: "Employee Recruiter",
  },
  {
    id: 3,
    name: "HR User Setup",
  },
  {
    id: 4,
    name: "Admin",
  },
  {
    id: 5,
    name: "HR Management",
  },
  {
    id: 6,
    name: "Shift Coordinator",
  },
];

export default roles;
