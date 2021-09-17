/*
  Warnings:

  - You are about to drop the column `newName` on the `custom_terms` table. All the data in the column will be lost.
  - Added the required column `termId` to the `custom_terms` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "custom_terms" DROP CONSTRAINT "custom_terms_newName_fkey";

-- AlterTable
ALTER TABLE "custom_terms" DROP COLUMN "newName",
ADD COLUMN     "jobTermsId" INTEGER,
ADD COLUMN     "termId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "custom_terms" ADD FOREIGN KEY ("termId") REFERENCES "offer_term"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "custom_terms" ADD FOREIGN KEY ("jobTermsId") REFERENCES "job_terms"("id") ON DELETE SET NULL ON UPDATE CASCADE;
