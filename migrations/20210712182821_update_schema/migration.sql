/*
  Warnings:

  - You are about to drop the `Designation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Employee` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Grade` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Salary` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Skills` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[employeeId]` on the table `emp_contact_details` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[employeeId]` on the table `emp_personal_details` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[employeeId]` on the table `education_qualifications` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[employeeId]` on the table `work_history` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[employeeId]` on the table `internal_work_history` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `employeeId` to the `education_qualifications` table without a default value. This is not possible if the table is not empty.
  - Added the required column `employeeId` to the `emp_contact_details` table without a default value. This is not possible if the table is not empty.
  - Added the required column `employeeId` to the `emp_personal_details` table without a default value. This is not possible if the table is not empty.
  - Added the required column `employeeId` to the `internal_work_history` table without a default value. This is not possible if the table is not empty.
  - Added the required column `employeeId` to the `work_history` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "job_offer_status" AS ENUM ('awaiting_response', 'accepted', 'rejected');

-- CreateEnum
CREATE TYPE "gender" AS ENUM ('male', 'female', 'other');

-- DropForeignKey
ALTER TABLE "Employee" DROP CONSTRAINT "Employee_contactDetailId_fkey";

-- DropForeignKey
ALTER TABLE "Employee" DROP CONSTRAINT "Employee_departmentId_fkey";

-- DropForeignKey
ALTER TABLE "Employee" DROP CONSTRAINT "Employee_designationId_fkey";

-- DropForeignKey
ALTER TABLE "Employee" DROP CONSTRAINT "Employee_educationQualificationId_fkey";

-- DropForeignKey
ALTER TABLE "Employee" DROP CONSTRAINT "Employee_employmentTypeId_fkey";

-- DropForeignKey
ALTER TABLE "Employee" DROP CONSTRAINT "Employee_gradeId_fkey";

-- DropForeignKey
ALTER TABLE "Employee" DROP CONSTRAINT "Employee_healthInsuaranceId_fkey";

-- DropForeignKey
ALTER TABLE "Employee" DROP CONSTRAINT "Employee_internalWorkHistoryId_fkey";

-- DropForeignKey
ALTER TABLE "Employee" DROP CONSTRAINT "Employee_personalDetailId_fkey";

-- DropForeignKey
ALTER TABLE "Employee" DROP CONSTRAINT "Employee_salaryId_fkey";

-- DropForeignKey
ALTER TABLE "Employee" DROP CONSTRAINT "Employee_workHistoryId_fkey";

-- DropForeignKey
ALTER TABLE "internal_work_history" DROP CONSTRAINT "internal_work_history_designationId_fkey";

-- DropForeignKey
ALTER TABLE "skills_of_designation" DROP CONSTRAINT "skills_of_designation_designation_id_fkey";

-- DropForeignKey
ALTER TABLE "skills_of_designation" DROP CONSTRAINT "skills_of_designation_skill_id_fkey";

-- AlterTable
ALTER TABLE "education_qualifications" ADD COLUMN     "employeeId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "emp_contact_details" ADD COLUMN     "employeeId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "emp_personal_details" ADD COLUMN     "employeeId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "internal_work_history" ADD COLUMN     "employeeId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "work_history" ADD COLUMN     "employeeId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "Designation";

-- DropTable
DROP TABLE "Employee";

-- DropTable
DROP TABLE "Grade";

-- DropTable
DROP TABLE "Salary";

-- DropTable
DROP TABLE "Skills";

-- DropEnum
DROP TYPE "Gender";

-- CreateTable
CREATE TABLE "employee" (
    "id" SERIAL NOT NULL,
    "first_name" TEXT NOT NULL,
    "middle_name" TEXT,
    "last_name" TEXT NOT NULL,
    "date_of_birth" TIMESTAMP(3) NOT NULL,
    "gender" "gender" NOT NULL,
    "salutation" TEXT NOT NULL,
    "joined_date" TIMESTAMP(3) NOT NULL,
    "employee_code" TEXT NOT NULL,
    "qr_code" TEXT NOT NULL,
    "emergency_person" TEXT NOT NULL,
    "emergency_contact" TEXT NOT NULL,
    "emergency_contact_relationship" TEXT NOT NULL,
    "image" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "gradeId" INTEGER NOT NULL,
    "healthInsuaranceId" INTEGER NOT NULL,
    "designationId" INTEGER NOT NULL,
    "departmentId" INTEGER NOT NULL,
    "employmentTypeId" INTEGER NOT NULL,
    "jObApplicantId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "grade" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "designation" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "skills" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "salary" (
    "id" SERIAL NOT NULL,
    "bank_name" VARCHAR(255) NOT NULL,
    "bank_account" VARCHAR(255) NOT NULL,
    "mode" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "employeeId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "staffing_plan" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "from_date" TIMESTAMP(3) NOT NULL,
    "to_date" TIMESTAMP(3) NOT NULL,
    "estimated_budget" DECIMAL(18,2) NOT NULL,
    "department_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "staffing_plan_detail" (
    "id" SERIAL NOT NULL,
    "designationId" INTEGER NOT NULL,
    "no_of_positions" INTEGER NOT NULL,
    "position_cost" DECIMAL(18,2) NOT NULL,
    "estimated_cost" DECIMAL(18,2) NOT NULL,
    "current_openings" INTEGER NOT NULL DEFAULT 0,
    "current_count" INTEGER NOT NULL DEFAULT 0,
    "staffing_plan_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "jobOpened" BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "job_opening" (
    "id" SERIAL NOT NULL,
    "job_title" VARCHAR(100) NOT NULL,
    "status" VARCHAR(100) NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "salary_range" VARCHAR(255) NOT NULL,
    "published" BOOLEAN NOT NULL DEFAULT false,
    "staffingPlanDetailId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "job_applicant_source" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "details" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "job_applicant" (
    "id" SERIAL NOT NULL,
    "applicant_name" VARCHAR(100) NOT NULL,
    "email" VARCHAR(200) NOT NULL,
    "status" VARCHAR(50) NOT NULL,
    "phone_number" INTEGER NOT NULL,
    "date_of_birth" TIMESTAMP(3) NOT NULL,
    "resume" VARCHAR(255) NOT NULL,
    "cover_letter" VARCHAR(255) NOT NULL,
    "jobOpeningId" INTEGER NOT NULL,
    "jobApplicantSourceId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "job_offer" (
    "id" SERIAL NOT NULL,
    "status" "job_offer_status" NOT NULL,
    "offer_date" TIMESTAMP(3) NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "applicantId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "offer_term" (
    "id" SERIAL NOT NULL,
    "term" VARCHAR(255) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "offer_term_of_job_offer" (
    "id" SERIAL NOT NULL,
    "value" VARCHAR(255) NOT NULL,
    "offer_term_id" INTEGER NOT NULL,
    "joboffer_id" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "appointment_letter" (
    "id" SERIAL NOT NULL,
    "body" TEXT NOT NULL,
    "jobApplicantId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "custom_terms" (
    "id" SERIAL NOT NULL,
    "newName" INTEGER NOT NULL,
    "new_description" VARCHAR(255) NOT NULL,
    "letterId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "job_terms" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "emp_contact_details_employeeId_unique" ON "emp_contact_details"("employeeId");

-- CreateIndex
CREATE UNIQUE INDEX "emp_personal_details_employeeId_unique" ON "emp_personal_details"("employeeId");

-- CreateIndex
CREATE UNIQUE INDEX "education_qualifications_employeeId_unique" ON "education_qualifications"("employeeId");

-- CreateIndex
CREATE UNIQUE INDEX "work_history_employeeId_unique" ON "work_history"("employeeId");

-- CreateIndex
CREATE UNIQUE INDEX "grade.name_unique" ON "grade"("name");

-- CreateIndex
CREATE UNIQUE INDEX "designation.name_unique" ON "designation"("name");

-- CreateIndex
CREATE UNIQUE INDEX "skills.name_unique" ON "skills"("name");

-- CreateIndex
CREATE UNIQUE INDEX "salary_employeeId_unique" ON "salary"("employeeId");

-- CreateIndex
CREATE UNIQUE INDEX "internal_work_history_employeeId_unique" ON "internal_work_history"("employeeId");

-- CreateIndex
CREATE UNIQUE INDEX "job_offer_applicantId_unique" ON "job_offer"("applicantId");

-- CreateIndex
CREATE UNIQUE INDEX "appointment_letter_jobApplicantId_unique" ON "appointment_letter"("jobApplicantId");

-- AddForeignKey
ALTER TABLE "employee" ADD FOREIGN KEY ("gradeId") REFERENCES "grade"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee" ADD FOREIGN KEY ("healthInsuaranceId") REFERENCES "health_insuarance"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee" ADD FOREIGN KEY ("designationId") REFERENCES "designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee" ADD FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee" ADD FOREIGN KEY ("employmentTypeId") REFERENCES "employment_type"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee" ADD FOREIGN KEY ("jObApplicantId") REFERENCES "job_applicant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "emp_contact_details" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "emp_personal_details" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "education_qualifications" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "work_history" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "skills_of_designation" ADD FOREIGN KEY ("skill_id") REFERENCES "skills"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "skills_of_designation" ADD FOREIGN KEY ("designation_id") REFERENCES "designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "salary" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "internal_work_history" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "internal_work_history" ADD FOREIGN KEY ("designationId") REFERENCES "designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "staffing_plan" ADD FOREIGN KEY ("department_id") REFERENCES "Department"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "staffing_plan_detail" ADD FOREIGN KEY ("designationId") REFERENCES "designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "staffing_plan_detail" ADD FOREIGN KEY ("staffing_plan_id") REFERENCES "staffing_plan"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "job_opening" ADD FOREIGN KEY ("staffingPlanDetailId") REFERENCES "staffing_plan_detail"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "job_applicant" ADD FOREIGN KEY ("jobOpeningId") REFERENCES "job_opening"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "job_applicant" ADD FOREIGN KEY ("jobApplicantSourceId") REFERENCES "job_applicant_source"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "job_offer" ADD FOREIGN KEY ("applicantId") REFERENCES "job_applicant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "offer_term_of_job_offer" ADD FOREIGN KEY ("offer_term_id") REFERENCES "offer_term"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "offer_term_of_job_offer" ADD FOREIGN KEY ("joboffer_id") REFERENCES "job_offer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "appointment_letter" ADD FOREIGN KEY ("jobApplicantId") REFERENCES "job_applicant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "custom_terms" ADD FOREIGN KEY ("newName") REFERENCES "job_terms"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "custom_terms" ADD FOREIGN KEY ("letterId") REFERENCES "appointment_letter"("id") ON DELETE CASCADE ON UPDATE CASCADE;
