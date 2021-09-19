/*
  Warnings:

  - You are about to drop the column `endTime` on the `shift_type` table. All the data in the column will be lost.
  - You are about to drop the column `startTime` on the `shift_type` table. All the data in the column will be lost.
  - Added the required column `end_time` to the `shift_type` table without a default value. This is not possible if the table is not empty.
  - Added the required column `start_time` to the `shift_type` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "responsibility_allocation" ALTER COLUMN "score" DROP NOT NULL,
ALTER COLUMN "dateCompleted" DROP DEFAULT;

-- AlterTable
ALTER TABLE "shift_type" DROP COLUMN "endTime",
DROP COLUMN "startTime",
ADD COLUMN     "end_time" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "start_time" TIMESTAMP(3) NOT NULL;
