-- AlterTable
ALTER TABLE "Employee" ADD COLUMN     "jObApplicantId" INTEGER;

-- CreateTable
CREATE TABLE "job_applicant" (
    "id" SERIAL NOT NULL,
    "applicant_name" VARCHAR(100) NOT NULL,
    "email" VARCHAR(200) NOT NULL,
    "status" VARCHAR(50) NOT NULL,
    "phone_number" INTEGER NOT NULL,
    "from_date" TIMESTAMP(3) NOT NULL,
    "to_date" TIMESTAMP(3) NOT NULL,
    "designationId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Employee" ADD FOREIGN KEY ("jObApplicantId") REFERENCES "job_applicant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "job_applicant" ADD FOREIGN KEY ("designationId") REFERENCES "Designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;
