-- CreateTable
CREATE TABLE "leave_period" (
    "id" SERIAL NOT NULL,
    "from_date" TIMESTAMP(3) NOT NULL,
    "to_date" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "holidayListId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "leave_period_holidayListId_unique" ON "leave_period"("holidayListId");

-- AddForeignKey
ALTER TABLE "leave_period" ADD FOREIGN KEY ("holidayListId") REFERENCES "holiday_list"("id") ON DELETE CASCADE ON UPDATE CASCADE;
