/*
  Warnings:

  - Added the required column `leavePolicyId` to the `leave_policy_detail` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "leave_policy_detail" ADD COLUMN     "leavePolicyId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "leave_policy_detail" ADD FOREIGN KEY ("leavePolicyId") REFERENCES "leave_policy"("id") ON DELETE CASCADE ON UPDATE CASCADE;
