/*
  Warnings:

  - Added the required column `designationId` to the `job_offer` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "job_offer" ADD COLUMN     "designationId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "job_offer" ADD FOREIGN KEY ("designationId") REFERENCES "designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;
