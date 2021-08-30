-- CreateTable
CREATE TABLE "company" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "logoImage" VARCHAR(255) NOT NULL,
    "address" VARCHAR(255) NOT NULL,
    "contactNumbers" VARCHAR(255) NOT NULL,
    "emails" VARCHAR(255) NOT NULL,
    "holidayListId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "company_holidayListId_unique" ON "company"("holidayListId");

-- AddForeignKey
ALTER TABLE "company" ADD FOREIGN KEY ("holidayListId") REFERENCES "holiday_list"("id") ON DELETE CASCADE ON UPDATE CASCADE;
