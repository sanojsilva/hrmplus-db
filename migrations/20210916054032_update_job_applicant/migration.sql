-- AlterTable
ALTER TABLE "job_applicant" ADD COLUMN     "academicQualifications" TEXT,
ADD COLUMN     "alResults" VARCHAR(250),
ADD COLUMN     "degree" VARCHAR(300),
ADD COLUMN     "haveDegree" BOOLEAN DEFAULT false,
ADD COLUMN     "passedAl" BOOLEAN DEFAULT false,
ADD COLUMN     "passedOls" BOOLEAN DEFAULT false,
ADD COLUMN     "remarks" TEXT,
ADD COLUMN     "workExperience" TEXT;
