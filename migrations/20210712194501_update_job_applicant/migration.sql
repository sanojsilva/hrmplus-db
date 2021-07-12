/*
  Warnings:

  - Added the required column `gender` to the `job_applicant` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `status` on the `job_applicant` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "JobApplicantStatus" AS ENUM ('open', 'rejected', 'accepted');

-- AlterTable
ALTER TABLE "job_applicant" ADD COLUMN     "gender" "gender" NOT NULL,
DROP COLUMN "status",
ADD COLUMN     "status" "JobApplicantStatus" NOT NULL,
ALTER COLUMN "phone_number" SET DATA TYPE VARCHAR(12),
ALTER COLUMN "jobApplicantSourceId" DROP NOT NULL;
