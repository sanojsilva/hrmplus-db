const designations = [
  {
    id: 1,
    name: "Software Engineer",
    description: "Software Engineer",
    createdAt: "2021-09-03T06:08:16.123Z",
    updatedAt: "2021-09-03T06:08:16.124Z",
    gradeId: 3,
  },
  {
    id: 2,
    name: "UI/UX Engineer",
    description: "UI/UX Engineer",
    createdAt: "2021-09-03T06:09:16.731Z",
    updatedAt: "2021-09-03T06:09:16.732Z",
    gradeId: 3,
  },
  {
    id: 3,
    name: "CEO",
    description: "CEO",
    createdAt: "2021-09-12T06:15:17.797Z",
    updatedAt: "2021-09-12T06:15:17.797Z",
    gradeId: 1,
  },
  {
    id: 4,
    name: "HR Manager",
    description: "HR Manager",
    createdAt: "2021-09-12T06:15:23.741Z",
    updatedAt: "2021-09-12T06:15:23.742Z",
    gradeId: 5,
  },
  {
    id: 5,
    name: "Secretary",
    description: "Secretary",
    createdAt: "2021-09-12T06:15:49.653Z",
    updatedAt: "2021-09-12T06:15:49.654Z",
    gradeId: 6,
  },
  {
    id: 6,
    name: "Accountant",
    description: "Accountant",
    createdAt: "2021-09-12T06:15:55.755Z",
    updatedAt: "2021-09-12T06:15:55.756Z",
    gradeId: 6,
  },
  {
    id: 7,
    name: "Head of Marketing & Sales",
    description: "Head of Marketing & Sales",
    createdAt: "2021-09-12T06:16:40.957Z",
    updatedAt: "2021-09-12T06:16:40.958Z",
    gradeId: 3,
  },
  {
    id: 9,
    name: "Managing Director",
    description: "Managing Director",
    createdAt: "2021-09-12T06:17:37.852Z",
    updatedAt: "2021-09-12T06:17:37.853Z",
    gradeId: 2,
  },
  {
    id: 10,
    name: "Manager",
    description: "Manager",
    createdAt: "2021-09-12T06:18:11.513Z",
    updatedAt: "2021-09-12T06:18:11.513Z",
    gradeId: 5,
  },
  {
    id: 11,
    name: "COO",
    description: "COO",
    createdAt: "2021-09-12T06:18:39.686Z",
    updatedAt: "2021-09-12T06:18:39.687Z",
    gradeId: 2,
  },
  {
    id: 12,
    name: "CFO",
    description: "CFO",
    createdAt: "2021-09-12T06:18:43.302Z",
    updatedAt: "2021-09-12T06:18:43.302Z",
    gradeId: 2,
  },
  {
    id: 13,
    name: "CTO",
    description: "CMO",
    createdAt: "2021-09-12T06:18:53.356Z",
    updatedAt: "2021-09-12T06:18:53.357Z",
    gradeId: 2,
  },
  {
    id: 8,
    name: "Project Manager",
    description: "Project Manager",
    createdAt: "2021-09-12T06:16:49.836Z",
    updatedAt: "2021-09-12T06:19:28.990Z",
    gradeId: 5,
  },
  {
    id: 14,
    name: "CMO",
    description: "CMO",
    createdAt: "2021-09-12T06:19:42.084Z",
    updatedAt: "2021-09-12T06:19:42.084Z",
    gradeId: 2,
  },
  {
    id: 15,
    name: "Marketing Manager",
    description: "Marketing Manager",
    createdAt: "2021-09-12T06:20:09.464Z",
    updatedAt: "2021-09-12T06:20:09.465Z",
    gradeId: 5,
  },
  {
    id: 16,
    name: "Product Manager",
    description: "Product Manager",
    createdAt: "2021-09-12T06:20:15.294Z",
    updatedAt: "2021-09-12T06:20:15.295Z",
    gradeId: 5,
  },
  {
    id: 17,
    name: "Finance Manager",
    description: "Finance Manager",
    createdAt: "2021-09-12T06:20:33.355Z",
    updatedAt: "2021-09-12T06:20:33.356Z",
    gradeId: 5,
  },
  {
    id: 18,
    name: "Human resource personnel",
    description: "Human resource personnel",
    createdAt: "2021-09-12T06:20:45.964Z",
    updatedAt: "2021-09-12T06:20:45.964Z",
    gradeId: 6,
  },
  {
    id: 19,
    name: "Sales representative",
    description: "Sales representative",
    createdAt: "2021-09-12T06:20:54.800Z",
    updatedAt: "2021-09-12T06:20:54.800Z",
    gradeId: 6,
  },
  {
    id: 20,
    name: "Customer service representative",
    description: "Customer service representative",
    createdAt: "2021-09-12T06:21:06.522Z",
    updatedAt: "2021-09-12T06:21:06.523Z",
    gradeId: 6,
  },
  {
    id: 21,
    name: "Business analyst",
    description: "Business analyst",
    createdAt: "2021-09-12T06:21:16.173Z",
    updatedAt: "2021-09-12T06:21:16.174Z",
    gradeId: 5,
  },
  {
    id: 22,
    name: "Marketing specialist",
    description: "Marketing specialist",
    createdAt: "2021-09-12T06:21:23.236Z",
    updatedAt: "2021-09-12T06:21:23.237Z",
    gradeId: 5,
  },
  {
    id: 23,
    name: "Administrative assistant",
    description: "Administrative assistant",
    createdAt: "2021-09-12T06:21:41.173Z",
    updatedAt: "2021-09-12T06:21:41.173Z",
    gradeId: 6,
  },
  {
    id: 24,
    name: "Recruiter",
    description: "Recruiter",
    createdAt: "2021-09-12T06:21:41.173Z",
    updatedAt: "2021-09-12T06:21:41.173Z",
    gradeId: 6,
  },
  {
    id: 25,
    name: "Human resource information specialist",
    description: "Human resource information specialist",
    createdAt: "2021-09-12T06:21:41.173Z",
    updatedAt: "2021-09-12T06:21:41.173Z",
    gradeId: 6,
  },
  {
    id: 26,
    name: "Intern",
    description: "Intern",
    createdAt: "2021-09-12T06:21:41.173Z",
    updatedAt: "2021-09-12T06:21:41.173Z",
    gradeId: 7,
  },
];

export default designations;
