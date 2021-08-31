/*
  Warnings:

  - You are about to drop the `HolidayList` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "company" DROP CONSTRAINT "company_holidayListId_fkey";

-- DropForeignKey
ALTER TABLE "holiday" DROP CONSTRAINT "holiday_holidayListId_fkey";

-- DropForeignKey
ALTER TABLE "leave_period" DROP CONSTRAINT "leave_period_holidayListId_fkey";

-- DropForeignKey
ALTER TABLE "shift_type" DROP CONSTRAINT "shift_type_holidayListId_fkey";

-- DropTable
DROP TABLE "HolidayList";

-- CreateTable
CREATE TABLE "holiday_list" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "from_date" TIMESTAMP(3) NOT NULL,
    "to_date" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "isSaturdayHoliday" BOOLEAN NOT NULL DEFAULT false,
    "isSundayHoliday" BOOLEAN NOT NULL DEFAULT false,
    "totalHolidays" INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "holiday" ADD FOREIGN KEY ("holidayListId") REFERENCES "holiday_list"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "leave_period" ADD FOREIGN KEY ("holidayListId") REFERENCES "holiday_list"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "shift_type" ADD FOREIGN KEY ("holidayListId") REFERENCES "holiday_list"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "company" ADD FOREIGN KEY ("holidayListId") REFERENCES "holiday_list"("id") ON DELETE CASCADE ON UPDATE CASCADE;
