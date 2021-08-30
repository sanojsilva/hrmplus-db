/*
  Warnings:

  - You are about to drop the column `holidayListId` on the `shift_type` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "shift_type" DROP CONSTRAINT "shift_type_holidayListId_fkey";

-- DropIndex
DROP INDEX "shift_type_holidayListId_unique";

-- AlterTable
ALTER TABLE "shift_type" DROP COLUMN "holidayListId";
