-- AlterTable
ALTER TABLE "designation" ADD COLUMN     "grade_id" INTEGER;

-- AddForeignKey
ALTER TABLE "designation" ADD FOREIGN KEY ("grade_id") REFERENCES "grade"("id") ON DELETE SET NULL ON UPDATE CASCADE;
