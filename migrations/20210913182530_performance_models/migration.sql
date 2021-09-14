-- CreateEnum
CREATE TYPE "ResponsibilityStatus" AS ENUM ('pending', 'completed');

-- DropIndex
DROP INDEX "onboarding_activity_assignedEmployeeId_unique";

-- CreateTable
CREATE TABLE "responsibilities" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "departmentId" INTEGER NOT NULL,
    "designationId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "responsibility_allocation" (
    "id" SERIAL NOT NULL,
    "responsibilityId" INTEGER NOT NULL,
    "weightage" INTEGER NOT NULL,
    "score" INTEGER NOT NULL,
    "status" "ResponsibilityStatus" NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL,
    "assignedEmployeeId" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ResponsibilitiesToResponsibilityAllocation" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ResponsibilitiesToResponsibilityAllocation_AB_unique" ON "_ResponsibilitiesToResponsibilityAllocation"("A", "B");

-- CreateIndex
CREATE INDEX "_ResponsibilitiesToResponsibilityAllocation_B_index" ON "_ResponsibilitiesToResponsibilityAllocation"("B");

-- AddForeignKey
ALTER TABLE "responsibilities" ADD FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "responsibilities" ADD FOREIGN KEY ("designationId") REFERENCES "designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "responsibility_allocation" ADD FOREIGN KEY ("responsibilityId") REFERENCES "responsibilities"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "responsibility_allocation" ADD FOREIGN KEY ("assignedEmployeeId") REFERENCES "employee"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ResponsibilitiesToResponsibilityAllocation" ADD FOREIGN KEY ("A") REFERENCES "responsibilities"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ResponsibilitiesToResponsibilityAllocation" ADD FOREIGN KEY ("B") REFERENCES "responsibility_allocation"("id") ON DELETE CASCADE ON UPDATE CASCADE;
