-- CreateTable
CREATE TABLE "shift_type" (
    "id" SERIAL NOT NULL,
    "shiftName" VARCHAR(100) NOT NULL,
    "startTime" VARCHAR(5) NOT NULL,
    "endTime" VARCHAR(5) NOT NULL,
    "determineCheckinAndCheckout" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "holidayListId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "shift_request" (
    "id" SERIAL NOT NULL,
    "approver" VARCHAR(100) NOT NULL,
    "start_date" TIMESTAMP(3) NOT NULL,
    "end_date" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "shiftTypeId" INTEGER NOT NULL,
    "employeeId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "shift_type_holidayListId_unique" ON "shift_type"("holidayListId");

-- CreateIndex
CREATE UNIQUE INDEX "shift_request_shiftTypeId_unique" ON "shift_request"("shiftTypeId");

-- AddForeignKey
ALTER TABLE "shift_type" ADD FOREIGN KEY ("holidayListId") REFERENCES "holiday_list"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "shift_request" ADD FOREIGN KEY ("shiftTypeId") REFERENCES "shift_type"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "shift_request" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;
