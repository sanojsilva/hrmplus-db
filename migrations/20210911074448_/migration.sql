/*
  Warnings:

  - You are about to drop the column `determineCheckinAndCheckout` on the `shift_type` table. All the data in the column will be lost.
  - You are about to drop the `TrainingEvent` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "TrainingDetails" DROP CONSTRAINT "TrainingDetails_trainingEventId_fkey";

-- AlterTable
ALTER TABLE "shift_request" ADD COLUMN     "status" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "shift_type" DROP COLUMN "determineCheckinAndCheckout",
ADD COLUMN     "isActive" BOOLEAN NOT NULL DEFAULT true;

-- AlterTable
ALTER TABLE "TrainingDetails" ADD COLUMN     "trainingFeedbackId" INTEGER;

-- DropTable
DROP TABLE "TrainingEvent";

-- CreateTable
CREATE TABLE "training_event" (
    "id" SERIAL NOT NULL,
    "eventName" VARCHAR(100) NOT NULL,
    "eventStatus" VARCHAR(100) NOT NULL,
    "start_time" TIMESTAMP(3) NOT NULL,
    "end_time" TIMESTAMP(3) NOT NULL,
    "trainerName" VARCHAR(100) NOT NULL,
    "trainerEmail" VARCHAR(100) NOT NULL,
    "trainerContactNo" INTEGER NOT NULL,
    "location" VARCHAR(100) NOT NULL,
    "level" VARCHAR(100) NOT NULL,
    "type" VARCHAR(100) NOT NULL,
    "introduction" VARCHAR(200) NOT NULL,
    "hasCertificate" BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "employee_training_event" (
    "status" VARCHAR(10) NOT NULL,
    "attendance" BOOLEAN NOT NULL DEFAULT false,
    "isMandatory" BOOLEAN NOT NULL DEFAULT false,
    "employeeFeedback" VARCHAR(200) NOT NULL,
    "employeerating" INTEGER NOT NULL,
    "trainerComment" VARCHAR(200) NOT NULL,
    "trainerGrade" VARCHAR(1) NOT NULL,
    "employee_id" INTEGER NOT NULL,
    "training_event_id" INTEGER NOT NULL,

    PRIMARY KEY ("employee_id","training_event_id")
);

-- AddForeignKey
ALTER TABLE "TrainingDetails" ADD FOREIGN KEY ("trainingEventId") REFERENCES "training_event"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee_training_event" ADD FOREIGN KEY ("employee_id") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee_training_event" ADD FOREIGN KEY ("training_event_id") REFERENCES "training_event"("id") ON DELETE CASCADE ON UPDATE CASCADE;
