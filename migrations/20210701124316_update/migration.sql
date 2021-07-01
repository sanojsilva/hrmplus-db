/*
  Warnings:

  - The values [SELECT] on the enum `Gender` will be removed. If these variants are still used in the database, this will fail.
  - The values [SELECT] on the enum `marital_status` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the column `createdAt` on the `Department` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Department` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Designation` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Designation` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `education_qualifications` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `education_qualifications` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `emp_contact_details` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `emp_contact_details` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `emp_personal_details` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `emp_personal_details` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `employment_type` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `employment_type` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Grade` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Grade` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `health_insuarance` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `health_insuarance` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `health_insuarance_provider` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `health_insuarance_provider` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `internal_work_history` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `internal_work_history` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Salary` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Salary` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Skills` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Skills` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `work_history` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `work_history` table. All the data in the column will be lost.
  - Added the required column `updated_at` to the `Department` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Designation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `education_qualifications` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `emp_contact_details` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `emp_personal_details` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `employment_type` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Grade` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `health_insuarance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `health_insuarance_provider` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `internal_work_history` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Salary` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Skills` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `work_history` table without a default value. This is not possible if the table is not empty.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "Gender_new" AS ENUM ('MALE', 'FEMALE', 'OTHER');
ALTER TABLE "Employee" ALTER COLUMN "gender" DROP DEFAULT;
ALTER TABLE "Employee" ALTER COLUMN "gender" TYPE "Gender_new" USING ("gender"::text::"Gender_new");
ALTER TYPE "Gender" RENAME TO "Gender_old";
ALTER TYPE "Gender_new" RENAME TO "Gender";
DROP TYPE "Gender_old";
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "marital_status_new" AS ENUM ('MARRIED', 'SINGLE', 'DIVORCED');
ALTER TABLE "emp_personal_details" ALTER COLUMN "marital_status" DROP DEFAULT;
ALTER TABLE "emp_personal_details" ALTER COLUMN "marital_status" TYPE "marital_status_new" USING ("marital_status"::text::"marital_status_new");
ALTER TYPE "marital_status" RENAME TO "marital_status_old";
ALTER TYPE "marital_status_new" RENAME TO "marital_status";
DROP TYPE "marital_status_old";
COMMIT;

-- AlterTable
ALTER TABLE "Department" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Designation" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "education_qualifications" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "emp_contact_details" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "emp_personal_details" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL,
ALTER COLUMN "marital_status" DROP DEFAULT;

-- AlterTable
ALTER TABLE "Employee" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL,
ALTER COLUMN "gender" DROP DEFAULT;

-- AlterTable
ALTER TABLE "employment_type" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Grade" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "health_insuarance" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "health_insuarance_provider" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "internal_work_history" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Salary" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Skills" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "work_history" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;
