/*
  Warnings:

  - You are about to drop the column `currentStatus` on the `promotion_details` table. All the data in the column will be lost.
  - You are about to drop the column `newStatus` on the `promotion_details` table. All the data in the column will be lost.
  - You are about to drop the `holiday_list` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `updated_at` to the `onboarding` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `promotion` table without a default value. This is not possible if the table is not empty.
  - Added the required column `current_status` to the `promotion_details` table without a default value. This is not possible if the table is not empty.
  - Added the required column `new_status` to the `promotion_details` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "SeperationStatus" AS ENUM ('pending', 'completed');

-- DropForeignKey
ALTER TABLE "company" DROP CONSTRAINT "company_holidayListId_fkey";

-- DropForeignKey
ALTER TABLE "holiday" DROP CONSTRAINT "holiday_holidayListId_fkey";

-- DropForeignKey
ALTER TABLE "leave_period" DROP CONSTRAINT "leave_period_holidayListId_fkey";

-- DropForeignKey
ALTER TABLE "shift_type" DROP CONSTRAINT "shift_type_holidayListId_fkey";

-- AlterTable
ALTER TABLE "onboarding" ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "promotion" ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "promotion_details" DROP COLUMN "currentStatus",
DROP COLUMN "newStatus",
ADD COLUMN     "current_status" INTEGER NOT NULL,
ADD COLUMN     "new_status" INTEGER NOT NULL;

-- DropTable
DROP TABLE "holiday_list";

-- CreateTable
CREATE TABLE "transfer" (
    "id" SERIAL NOT NULL,
    "transfer_date" TIMESTAMP(3) NOT NULL,
    "employeeId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HolidayList" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "from_date" TIMESTAMP(3) NOT NULL,
    "to_date" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "isSaturdayHoliday" BOOLEAN NOT NULL DEFAULT false,
    "isSundayHoliday" BOOLEAN NOT NULL DEFAULT false,
    "totalHolidays" INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "transfer_details" (
    "id" SERIAL NOT NULL,
    "area" TEXT NOT NULL,
    "current_status" INTEGER NOT NULL,
    "new_status" INTEGER NOT NULL,
    "transferId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "seperation" (
    "id" SERIAL NOT NULL,
    "seperation_date" TIMESTAMP(3) NOT NULL,
    "assigned_employee" TEXT NOT NULL,
    "status" "SeperationStatus" NOT NULL,
    "employeeId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "separation_activity" (
    "id" SERIAL NOT NULL,
    "activity" TEXT NOT NULL,
    "seperationId" INTEGER NOT NULL,
    "assignedEmployeeId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "notification" (
    "id" SERIAL NOT NULL,
    "message" TEXT NOT NULL,
    "link" TEXT,
    "read" BOOLEAN NOT NULL,
    "recieved_employee_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "attendance" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "in_time" TIMESTAMP(3) NOT NULL,
    "out_time" TIMESTAMP(3) NOT NULL,
    "working_hours" DECIMAL(65,30) NOT NULL,
    "lateEntry" BOOLEAN NOT NULL DEFAULT false,
    "earlyExit" BOOLEAN NOT NULL DEFAULT false,
    "status" VARCHAR(255) NOT NULL,
    "employeeId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "attendance_request" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "to_date" TIMESTAMP(3) NOT NULL,
    "from_date" TIMESTAMP(3) NOT NULL,
    "reason" VARCHAR(255) NOT NULL,
    "explanation" VARCHAR(255) NOT NULL,
    "employeeId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "attendance_request_details" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "halfOrFull" VARCHAR(10) NOT NULL,
    "attendanceRequestId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "seperation_employeeId_unique" ON "seperation"("employeeId");

-- AddForeignKey
ALTER TABLE "promotion_details" ADD FOREIGN KEY ("current_status") REFERENCES "designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "promotion_details" ADD FOREIGN KEY ("new_status") REFERENCES "designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transfer" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "holiday" ADD FOREIGN KEY ("holidayListId") REFERENCES "HolidayList"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transfer_details" ADD FOREIGN KEY ("current_status") REFERENCES "Department"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transfer_details" ADD FOREIGN KEY ("new_status") REFERENCES "Department"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transfer_details" ADD FOREIGN KEY ("transferId") REFERENCES "transfer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "seperation" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "separation_activity" ADD FOREIGN KEY ("seperationId") REFERENCES "seperation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "separation_activity" ADD FOREIGN KEY ("assignedEmployeeId") REFERENCES "employee"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notification" ADD FOREIGN KEY ("recieved_employee_id") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "leave_period" ADD FOREIGN KEY ("holidayListId") REFERENCES "HolidayList"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "shift_type" ADD FOREIGN KEY ("holidayListId") REFERENCES "HolidayList"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "company" ADD FOREIGN KEY ("holidayListId") REFERENCES "HolidayList"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attendance" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attendance_request" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attendance_request_details" ADD FOREIGN KEY ("attendanceRequestId") REFERENCES "attendance_request"("id") ON DELETE CASCADE ON UPDATE CASCADE;
