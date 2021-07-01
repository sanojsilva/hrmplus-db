-- CreateEnum
CREATE TYPE "marital_status" AS ENUM ('SELECT', 'MARRIED', 'SINGLE', 'DIVORCED');

-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('SELECT', 'MALE', 'FEMALE', 'OTHER');

-- CreateTable
CREATE TABLE "Employee" (
    "id" SERIAL NOT NULL,
    "first_name" TEXT NOT NULL,
    "middle_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "date_of_birth" TIMESTAMP(3) NOT NULL,
    "gender" "Gender" NOT NULL DEFAULT E'SELECT',
    "salutation" TEXT NOT NULL,
    "joined_date" TIMESTAMP(3) NOT NULL,
    "employee_code" TEXT NOT NULL,
    "qr_code" TEXT NOT NULL,
    "emergency_person" TEXT NOT NULL,
    "emergency_contact" TEXT NOT NULL,
    "emergency_contact_relationship" TEXT NOT NULL,
    "image" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "contactDetailId" INTEGER NOT NULL,
    "personalDetailId" INTEGER NOT NULL,
    "educationQualificationId" INTEGER NOT NULL,
    "workHistoryId" INTEGER NOT NULL,
    "gradeId" INTEGER NOT NULL,
    "healthInsuaranceId" INTEGER NOT NULL,
    "designationId" INTEGER NOT NULL,
    "salaryId" INTEGER NOT NULL,
    "departmentId" INTEGER NOT NULL,
    "internalWorkHistoryId" INTEGER NOT NULL,
    "employmentTypeId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "emp_contact_details" (
    "id" SERIAL NOT NULL,
    "mobile_no" VARCHAR(255) NOT NULL,
    "personal_email" VARCHAR(255) NOT NULL,
    "company_email" VARCHAR(255) NOT NULL,
    "preffered_email" VARCHAR(255) NOT NULL,
    "current_addr" VARCHAR(255) NOT NULL,
    "current_accommodation_type" VARCHAR(255) NOT NULL,
    "permenant_addr" VARCHAR(255) NOT NULL,
    "permenant_accommodation_type" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "emp_personal_details" (
    "id" SERIAL NOT NULL,
    "nic" VARCHAR(255) NOT NULL,
    "marital_status" "marital_status" NOT NULL DEFAULT E'SELECT',
    "blood_group" VARCHAR(255) NOT NULL,
    "family_details" TEXT NOT NULL,
    "health_details" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "education_qualifications" (
    "id" SERIAL NOT NULL,
    "school_or_uni" VARCHAR(255) NOT NULL,
    "level" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "work_history" (
    "id" SERIAL NOT NULL,
    "comapny" VARCHAR(255) NOT NULL,
    "designation" VARCHAR(255) NOT NULL,
    "salary" VARCHAR(255) NOT NULL,
    "addr" VARCHAR(255) NOT NULL,
    "contact" VARCHAR(255) NOT NULL,
    "experience" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Grade" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "health_insuarance" (
    "id" SERIAL NOT NULL,
    "number" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "providerId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "health_insuarance_provider" (
    "id" SERIAL NOT NULL,
    "provider" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Designation" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "skills_of_designation" (
    "id" SERIAL NOT NULL,
    "skill_id" INTEGER NOT NULL,
    "designation_id" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Skills" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Salary" (
    "id" SERIAL NOT NULL,
    "bank_name" VARCHAR(255) NOT NULL,
    "bank_account" VARCHAR(255) NOT NULL,
    "mode" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Department" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "employment_type" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "internal_work_history" (
    "id" SERIAL NOT NULL,
    "from_date" TIMESTAMP(3) NOT NULL,
    "to_date" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "designationId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Grade.name_unique" ON "Grade"("name");

-- CreateIndex
CREATE UNIQUE INDEX "health_insuarance.number_unique" ON "health_insuarance"("number");

-- CreateIndex
CREATE UNIQUE INDEX "health_insuarance_provider.provider_unique" ON "health_insuarance_provider"("provider");

-- CreateIndex
CREATE UNIQUE INDEX "Designation.name_unique" ON "Designation"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Skills.name_unique" ON "Skills"("name");

-- AddForeignKey
ALTER TABLE "Employee" ADD FOREIGN KEY ("contactDetailId") REFERENCES "emp_contact_details"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD FOREIGN KEY ("personalDetailId") REFERENCES "emp_personal_details"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD FOREIGN KEY ("educationQualificationId") REFERENCES "education_qualifications"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD FOREIGN KEY ("workHistoryId") REFERENCES "work_history"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD FOREIGN KEY ("gradeId") REFERENCES "Grade"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD FOREIGN KEY ("healthInsuaranceId") REFERENCES "health_insuarance"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD FOREIGN KEY ("designationId") REFERENCES "Designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD FOREIGN KEY ("salaryId") REFERENCES "Salary"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD FOREIGN KEY ("internalWorkHistoryId") REFERENCES "internal_work_history"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD FOREIGN KEY ("employmentTypeId") REFERENCES "employment_type"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "health_insuarance" ADD FOREIGN KEY ("providerId") REFERENCES "health_insuarance_provider"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "skills_of_designation" ADD FOREIGN KEY ("skill_id") REFERENCES "Skills"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "skills_of_designation" ADD FOREIGN KEY ("designation_id") REFERENCES "Designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "internal_work_history" ADD FOREIGN KEY ("designationId") REFERENCES "Designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;
