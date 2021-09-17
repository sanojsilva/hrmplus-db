/*
  Warnings:

  - Added the required column `description` to the `offer_term` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "offer_term" ADD COLUMN     "description" VARCHAR(500) NOT NULL;
