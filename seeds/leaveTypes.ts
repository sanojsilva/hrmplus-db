const leaveTypes = [
  {
    id: 1,
    typeName: "Leave Without Pay",
    maxContinuousDays: 3,
    maxLeaves: 8,
    applicableAfter: 0,
    allowEncashment: false,
    encashmentThreshholdDays: 0,
    canCarryForward: false,
    maxCarryForward: 0,
    withoutPay: true,
    includeHoliday: false,
    isCompensatory: false,
    isEarnedLeave: false,
    earnedLeaveFreq: "MONTHLY",
    createdAt: "2021-09-18T05:35:28.805Z",
    updatedAt: "2021-09-18T06:06:21.216Z",
  },
  {
    id: 2,
    typeName: "Casual Leave",
    maxContinuousDays: 2,
    maxLeaves: 12,
    applicableAfter: 0,
    allowEncashment: false,
    encashmentThreshholdDays: 0,
    canCarryForward: false,
    maxCarryForward: 0,
    withoutPay: false,
    includeHoliday: false,
    isCompensatory: false,
    isEarnedLeave: false,
    earnedLeaveFreq: "MONTHLY",
    createdAt: "2021-09-18T05:35:36.855Z",
    updatedAt: "2021-09-18T06:06:31.705Z",
  },
  {
    id: 3,
    typeName: "Sick Leave",
    maxContinuousDays: 12,
    maxLeaves: 15,
    applicableAfter: 0,
    allowEncashment: false,
    encashmentThreshholdDays: 0,
    canCarryForward: true,
    maxCarryForward: 5,
    withoutPay: false,
    includeHoliday: false,
    isCompensatory: false,
    isEarnedLeave: false,
    earnedLeaveFreq: "MONTHLY",
    createdAt: "2021-09-18T05:35:42.967Z",
    updatedAt: "2021-09-18T06:06:39.323Z",
  },
  {
    id: 4,
    typeName: "Privilege leave",
    maxContinuousDays: 14,
    maxLeaves: 14,
    applicableAfter: 0,
    allowEncashment: false,
    encashmentThreshholdDays: 0,
    canCarryForward: false,
    maxCarryForward: 0,
    withoutPay: false,
    includeHoliday: false,
    isCompensatory: false,
    isEarnedLeave: false,
    earnedLeaveFreq: "YEARLY",
    createdAt: "2021-09-18T05:36:04.793Z",
    updatedAt: "2021-09-18T06:06:58.681Z",
  },
  {
    id: 5,
    typeName: "Compensatory off",
    maxContinuousDays: 2,
    maxLeaves: 10,
    applicableAfter: 0,
    allowEncashment: false,
    encashmentThreshholdDays: 0,
    canCarryForward: false,
    maxCarryForward: 0,
    withoutPay: false,
    includeHoliday: false,
    isCompensatory: true,
    isEarnedLeave: false,
    earnedLeaveFreq: "MONTHLY",
    createdAt: "2021-09-18T05:36:11.107Z",
    updatedAt: "2021-09-18T06:08:41.285Z",
  },
  {
    id: 6,
    typeName: "Maternity Leave",
    maxContinuousDays: 119,
    maxLeaves: 119,
    applicableAfter: 0,
    allowEncashment: false,
    encashmentThreshholdDays: 0,
    canCarryForward: false,
    maxCarryForward: 0,
    withoutPay: false,
    includeHoliday: false,
    isCompensatory: false,
    isEarnedLeave: false,
    earnedLeaveFreq: "MONTHLY",
    createdAt: "2021-09-18T05:36:17.202Z",
    updatedAt: "2021-09-18T06:08:49.483Z",
  },
  {
    id: 7,
    typeName: "Earned leave",
    maxContinuousDays: 2,
    maxLeaves: 0,
    applicableAfter: 0,
    allowEncashment: false,
    encashmentThreshholdDays: 0,
    canCarryForward: false,
    maxCarryForward: 0,
    withoutPay: false,
    includeHoliday: false,
    isCompensatory: false,
    isEarnedLeave: true,
    earnedLeaveFreq: "MONTHLY",
    createdAt: "2021-09-18T05:43:46.066Z",
    updatedAt: "2021-09-18T06:09:02.413Z",
  },
  {
    id: 8,
    typeName: "Paternity Leave",
    maxContinuousDays: 14,
    maxLeaves: 14,
    applicableAfter: 0,
    allowEncashment: false,
    encashmentThreshholdDays: 0,
    canCarryForward: false,
    maxCarryForward: 0,
    withoutPay: false,
    includeHoliday: false,
    isCompensatory: false,
    isEarnedLeave: false,
    earnedLeaveFreq: "MONTHLY",
    createdAt: "2021-09-18T05:51:33.606Z",
    updatedAt: "2021-09-18T06:09:16.876Z",
  },
  {
    id: 9,
    typeName: "Bereavement leave",
    maxContinuousDays: 7,
    maxLeaves: 7,
    applicableAfter: 0,
    allowEncashment: false,
    encashmentThreshholdDays: 0,
    canCarryForward: false,
    maxCarryForward: 0,
    withoutPay: false,
    includeHoliday: false,
    isCompensatory: false,
    isEarnedLeave: false,
    earnedLeaveFreq: "MONTHLY",
    createdAt: "2021-09-18T05:52:14.272Z",
    updatedAt: "2021-09-18T06:09:22.989Z",
  },
];

export default leaveTypes;
