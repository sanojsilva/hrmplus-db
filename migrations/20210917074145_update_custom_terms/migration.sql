/*
  Warnings:

  - You are about to drop the column `jobTermsId` on the `custom_terms` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "custom_terms" DROP CONSTRAINT "custom_terms_jobTermsId_fkey";

-- AlterTable
ALTER TABLE "custom_terms" DROP COLUMN "jobTermsId";
