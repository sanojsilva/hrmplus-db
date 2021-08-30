-- AlterTable
ALTER TABLE "holiday_list" ADD COLUMN     "isSaturdayHoliday" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "isSundayHoliday" BOOLEAN NOT NULL DEFAULT false;
