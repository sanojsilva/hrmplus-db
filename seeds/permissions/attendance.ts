import { Permission } from "@prisma/client";

//starts from 600 - 700

const attendanceRoutes: Partial<Permission>[] = [
  {
    id: 600,
    name: "Create Attendance Checkin",
    frontendRoute:
      "/dashboard/core/attendance-checkin/create-attendancecheckin",
    backendRoute: "",
    module: "core",
  },
  {
    id: 601,
    name: "View Attendance Checkin",
    frontendRoute: "/dashboard/core/attendance-checkin/attendancecheckin",
    backendRoute: "",
    module: "core",
  },
  {
    id: 602,
    name: "Create Attendance Mark",
    frontendRoute: "/dashboard/core/attendance-mark/create-attendancemark",
    backendRoute: "",
    module: "core",
  },
  {
    id: 603,
    name: "View Attendance Mark",
    frontendRoute: "/dashboard/core/attendance-mark/attendancecmark",
    backendRoute: "",
    module: "core",
  },
];

export default attendanceRoutes;
