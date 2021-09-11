/*
  Warnings:

  - A unique constraint covering the columns `[employeeId]` on the table `user` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `employeeId` to the `user` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "user" ADD COLUMN     "employeeId" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "user_employeeId_unique" ON "user"("employeeId");

-- AddForeignKey
ALTER TABLE "user" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;
