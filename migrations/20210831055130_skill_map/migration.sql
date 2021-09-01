-- CreateTable
CREATE TABLE "SkillMap" (
    "id" SERIAL NOT NULL,
    "employeeId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SkillDetails" (
    "id" SERIAL NOT NULL,
    "skillId" INTEGER NOT NULL,
    "rating" INTEGER NOT NULL,
    "skillMapId" INTEGER NOT NULL,
    "evaluation_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrainingDetails" (
    "id" SERIAL NOT NULL,
    "skillMapId" INTEGER NOT NULL,
    "trainingEventId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrainingEvent" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "startTime" TIMESTAMP(3) NOT NULL,
    "endTime" TIMESTAMP(3) NOT NULL,
    "trainerName" TEXT NOT NULL,
    "location" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "SkillMap" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SkillDetails" ADD FOREIGN KEY ("skillId") REFERENCES "skills_of_designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SkillDetails" ADD FOREIGN KEY ("skillMapId") REFERENCES "SkillMap"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingDetails" ADD FOREIGN KEY ("skillMapId") REFERENCES "SkillMap"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingDetails" ADD FOREIGN KEY ("trainingEventId") REFERENCES "TrainingEvent"("id") ON DELETE CASCADE ON UPDATE CASCADE;
