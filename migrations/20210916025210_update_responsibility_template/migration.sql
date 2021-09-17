/*
  Warnings:

  - You are about to drop the column `deadline` on the `ResponsibilityTemplate` table. All the data in the column will be lost.
  - You are about to drop the column `expected` on the `ResponsibilityTemplate` table. All the data in the column will be lost.
  - You are about to drop the column `weightage` on the `ResponsibilityTemplate` table. All the data in the column will be lost.
  - Added the required column `expected` to the `ResponsibilitiesOfTemplate` table without a default value. This is not possible if the table is not empty.
  - Added the required column `weightage` to the `ResponsibilitiesOfTemplate` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "ResponsibilitiesOfTemplate" ADD COLUMN     "deadline" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "expected" INTEGER NOT NULL,
ADD COLUMN     "weightage" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "ResponsibilityTemplate" DROP COLUMN "deadline",
DROP COLUMN "expected",
DROP COLUMN "weightage";
