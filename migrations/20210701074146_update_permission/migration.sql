/*
  Warnings:

  - Added the required column `route` to the `permission` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "permission" ADD COLUMN     "route" VARCHAR(100) NOT NULL;
