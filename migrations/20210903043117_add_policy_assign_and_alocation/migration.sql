-- CreateTable
CREATE TABLE "leave_policy_assignment" (
    "id" SERIAL NOT NULL,
    "code" VARCHAR(100) NOT NULL,
    "add_unused" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "employee_id" INTEGER NOT NULL,
    "leave_policy_id" INTEGER NOT NULL,
    "leave_period_id" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "leave_alocation" (
    "id" SERIAL NOT NULL,
    "code" VARCHAR(100) NOT NULL,
    "add_unused" BOOLEAN NOT NULL DEFAULT false,
    "from_date" TIMESTAMP(3) NOT NULL,
    "to_date" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "employee_id" INTEGER NOT NULL,
    "leave_type_id" INTEGER NOT NULL,
    "leave_policy_assignment_id" INTEGER,

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "leave_policy_assignment" ADD FOREIGN KEY ("employee_id") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "leave_policy_assignment" ADD FOREIGN KEY ("leave_policy_id") REFERENCES "leave_policy"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "leave_policy_assignment" ADD FOREIGN KEY ("leave_period_id") REFERENCES "leave_period"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "leave_alocation" ADD FOREIGN KEY ("employee_id") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "leave_alocation" ADD FOREIGN KEY ("leave_type_id") REFERENCES "leave_type"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "leave_alocation" ADD FOREIGN KEY ("leave_policy_assignment_id") REFERENCES "leave_policy_assignment"("id") ON DELETE SET NULL ON UPDATE CASCADE;
