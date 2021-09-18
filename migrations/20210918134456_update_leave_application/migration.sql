-- AlterTable
ALTER TABLE "leave_application" ADD COLUMN     "actingEmployeeId" INTEGER,
ALTER COLUMN "employeeId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "leave_application" ADD FOREIGN KEY ("actingEmployeeId") REFERENCES "employee"("id") ON DELETE SET NULL ON UPDATE CASCADE;
