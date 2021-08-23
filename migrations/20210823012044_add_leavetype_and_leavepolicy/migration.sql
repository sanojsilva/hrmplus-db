-- CreateTable
CREATE TABLE "leave_type" (
    "id" SERIAL NOT NULL,
    "typeName" VARCHAR(100) NOT NULL,
    "maxContinuousDays" INTEGER NOT NULL DEFAULT 0,
    "maxLeaves" INTEGER NOT NULL DEFAULT 0,
    "allowEncashment" BOOLEAN NOT NULL DEFAULT false,
    "encashmentThreshholdDays" INTEGER NOT NULL DEFAULT 0,
    "canCarryForward" BOOLEAN NOT NULL DEFAULT false,
    "maxCarryForward" INTEGER NOT NULL DEFAULT 0,
    "withoutPay" BOOLEAN NOT NULL DEFAULT false,
    "includeHoliday" BOOLEAN NOT NULL DEFAULT false,
    "isCompensatory" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "leave_policy" (
    "id" SERIAL NOT NULL,
    "code" VARCHAR(100) NOT NULL,
    "year" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "leave_policy_detail" (
    "id" SERIAL NOT NULL,
    "annualAlocation" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "leaveTypeId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "leave_policy_detail" ADD FOREIGN KEY ("leaveTypeId") REFERENCES "leave_type"("id") ON DELETE CASCADE ON UPDATE CASCADE;
