-- AlterTable
ALTER TABLE "appointment_letter" ADD COLUMN     "appointmentDate" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "onboarding_activity" ADD COLUMN     "activityStatus" "OnboardingStatus" NOT NULL DEFAULT E'pending';

-- AlterTable
ALTER TABLE "separation_activity" ADD COLUMN     "activtyStatus" "SeperationStatus" NOT NULL DEFAULT E'pending';

-- CreateTable
CREATE TABLE "OnboardingActivities" (
    "id" SERIAL NOT NULL,
    "activity" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SeperationActivities" (
    "id" SERIAL NOT NULL,
    "activity" TEXT NOT NULL,

    PRIMARY KEY ("id")
);
