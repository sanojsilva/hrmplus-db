/*
  Warnings:

  - A unique constraint covering the columns `[holidayListId]` on the table `shift_type` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `holidayListId` to the `shift_type` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "shift_request_shiftTypeId_unique";

-- AlterTable
ALTER TABLE "shift_type" ADD COLUMN     "holidayListId" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "shift_assignment" (
    "id" SERIAL NOT NULL,
    "approver" VARCHAR(100) NOT NULL,
    "start_date" TIMESTAMP(3) NOT NULL,
    "end_date" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "shiftTypeId" INTEGER NOT NULL,
    "employeeId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "shift_type_holidayListId_unique" ON "shift_type"("holidayListId");

-- AddForeignKey
ALTER TABLE "shift_type" ADD FOREIGN KEY ("holidayListId") REFERENCES "holiday_list"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "shift_assignment" ADD FOREIGN KEY ("shiftTypeId") REFERENCES "shift_type"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "shift_assignment" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;
