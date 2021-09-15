/*
  Warnings:

  - You are about to drop the `_ResponsibilitiesToResponsibilityAllocation` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_ResponsibilitiesToResponsibilityAllocation" DROP CONSTRAINT "_ResponsibilitiesToResponsibilityAllocation_A_fkey";

-- DropForeignKey
ALTER TABLE "_ResponsibilitiesToResponsibilityAllocation" DROP CONSTRAINT "_ResponsibilitiesToResponsibilityAllocation_B_fkey";

-- DropTable
DROP TABLE "_ResponsibilitiesToResponsibilityAllocation";

-- CreateTable
CREATE TABLE "ResponsibilityTemplate" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "expected" INTEGER NOT NULL,
    "weightage" INTEGER NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ResponsibilitiesOfTemplate" (
    "id" SERIAL NOT NULL,
    "templateId" INTEGER NOT NULL,
    "responsibilityId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ResponsibilitiesOfTemplate" ADD FOREIGN KEY ("templateId") REFERENCES "ResponsibilityTemplate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResponsibilitiesOfTemplate" ADD FOREIGN KEY ("responsibilityId") REFERENCES "responsibilities"("id") ON DELETE CASCADE ON UPDATE CASCADE;
