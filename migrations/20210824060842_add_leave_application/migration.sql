-- CreateTable
CREATE TABLE "leave_application" (
    "id" SERIAL NOT NULL,
    "from_date" TIMESTAMP(3) NOT NULL,
    "to_date" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "reason" VARCHAR(255) NOT NULL,
    "total_leave_days" DECIMAL(18,2) NOT NULL,
    "status" VARCHAR(40) NOT NULL,
    "leaveTypeId" INTEGER NOT NULL,
    "employeeId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "leave_application_detail" (
    "id" SERIAL NOT NULL,
    "halfOrFull" VARCHAR(10) NOT NULL,
    "leave_date" TIMESTAMP(3) NOT NULL,
    "leaveApplicationId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "leave_application" ADD FOREIGN KEY ("leaveTypeId") REFERENCES "leave_type"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "leave_application" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "leave_application_detail" ADD FOREIGN KEY ("leaveApplicationId") REFERENCES "leave_application"("id") ON DELETE CASCADE ON UPDATE CASCADE;
