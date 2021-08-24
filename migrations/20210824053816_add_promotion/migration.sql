-- CreateTable
CREATE TABLE "promotion" (
    "id" SERIAL NOT NULL,
    "promotion_date" TIMESTAMP(3) NOT NULL,
    "employeeId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "promotion_details" (
    "id" SERIAL NOT NULL,
    "area" TEXT NOT NULL,
    "currentStatus" TEXT NOT NULL,
    "newStatus" TEXT NOT NULL,
    "promotionId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "promotion" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "promotion_details" ADD FOREIGN KEY ("promotionId") REFERENCES "promotion"("id") ON DELETE CASCADE ON UPDATE CASCADE;
