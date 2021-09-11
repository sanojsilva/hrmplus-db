/*
  Warnings:

  - You are about to drop the column `code` on the `permission` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "permission.code_unique";

-- AlterTable
ALTER TABLE "permission" DROP COLUMN "code";
