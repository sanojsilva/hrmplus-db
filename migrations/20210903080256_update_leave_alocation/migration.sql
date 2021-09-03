-- AlterTable
ALTER TABLE "leave_alocation" ADD COLUMN     "new_leaves_alocated" DECIMAL(18,2) NOT NULL DEFAULT 0,
ADD COLUMN     "total_leaves_alocated" DECIMAL(18,2) NOT NULL DEFAULT 0;
