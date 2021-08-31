/*
  Warnings:

  - Added the required column `earnedLeaveFreq` to the `leave_type` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "earned_leave_frequency" AS ENUM ('monthly', 'yearly');

-- AlterTable
ALTER TABLE "leave_type" ADD COLUMN     "applicableAfter" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "earnedLeaveFreq" "earned_leave_frequency" NOT NULL,
ADD COLUMN     "isEarnedLeave" BOOLEAN NOT NULL DEFAULT false;
