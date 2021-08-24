/*
  Warnings:

  - You are about to drop the column `jObApplicantId` on the `employee` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[jobApplicantId]` on the table `employee` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateEnum
CREATE TYPE "OnboardingStatus" AS ENUM ('pending', 'completed');

-- DropForeignKey
ALTER TABLE "employee" DROP CONSTRAINT "employee_jObApplicantId_fkey";

-- AlterTable
ALTER TABLE "employee" DROP COLUMN "jObApplicantId",
ADD COLUMN     "jobApplicantId" INTEGER;

-- CreateTable
CREATE TABLE "onboarding" (
    "id" SERIAL NOT NULL,
    "joined_date" TIMESTAMP(3) NOT NULL,
    "assignedEmployee" TEXT NOT NULL,
    "status" "OnboardingStatus" NOT NULL,
    "jobApplicantId" INTEGER NOT NULL,
    "employeeId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "onboarding_activity" (
    "id" SERIAL NOT NULL,
    "activity" TEXT NOT NULL,
    "onboardingId" INTEGER NOT NULL,
    "assignedEmployeeId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "holiday_list" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "from_date" TIMESTAMP(3) NOT NULL,
    "to_date" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "holiday" (
    "id" SERIAL NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "description" VARCHAR(200) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "holidayListId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "employee_jobApplicantId_unique" ON "employee"("jobApplicantId");

-- CreateIndex
CREATE UNIQUE INDEX "onboarding_jobApplicantId_unique" ON "onboarding"("jobApplicantId");

-- CreateIndex
CREATE UNIQUE INDEX "onboarding_employeeId_unique" ON "onboarding"("employeeId");

-- CreateIndex
CREATE UNIQUE INDEX "onboarding_activity_assignedEmployeeId_unique" ON "onboarding_activity"("assignedEmployeeId");

-- AddForeignKey
ALTER TABLE "employee" ADD FOREIGN KEY ("jobApplicantId") REFERENCES "job_applicant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "onboarding" ADD FOREIGN KEY ("jobApplicantId") REFERENCES "job_applicant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "onboarding" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "onboarding_activity" ADD FOREIGN KEY ("onboardingId") REFERENCES "onboarding"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "onboarding_activity" ADD FOREIGN KEY ("assignedEmployeeId") REFERENCES "employee"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "holiday" ADD FOREIGN KEY ("holidayListId") REFERENCES "holiday_list"("id") ON DELETE CASCADE ON UPDATE CASCADE;
