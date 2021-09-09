/*
  Warnings:

  - A unique constraint covering the columns `[code]` on the table `permission` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `code` to the `permission` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "permission" ADD COLUMN     "code" VARCHAR(20) NOT NULL;

-- CreateTable
CREATE TABLE "employee_check_in" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "time" TIMESTAMP(3) NOT NULL,
    "inOut" VARCHAR(255) NOT NULL,
    "employeeId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "permission.code_unique" ON "permission"("code");

-- AddForeignKey
ALTER TABLE "employee_check_in" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;
