-- CreateEnum
CREATE TYPE "marital_status" AS ENUM ('MARRIED', 'SINGLE', 'DIVORCED');

-- CreateEnum
CREATE TYPE "job_offer_status" AS ENUM ('not_sent_yet', 'awaiting_response', 'accepted', 'rejected');

-- CreateEnum
CREATE TYPE "gender" AS ENUM ('male', 'female', 'other');

-- CreateEnum
CREATE TYPE "JobApplicantStatus" AS ENUM ('open', 'rejected', 'accepted');

-- CreateEnum
CREATE TYPE "OnboardingStatus" AS ENUM ('pending', 'completed');

-- CreateEnum
CREATE TYPE "SeperationStatus" AS ENUM ('pending', 'completed');

-- CreateEnum
CREATE TYPE "earned_leave_frequency" AS ENUM ('monthly', 'yearly');

-- CreateEnum
CREATE TYPE "ResponsibilityStatus" AS ENUM ('pending', 'completed');

-- CreateTable
CREATE TABLE "user" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "username" TEXT,
    "password" VARCHAR(255) NOT NULL,
    "reset_password_token" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "employeeId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "permission" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "frontend_route" VARCHAR(255) NOT NULL,
    "backend_route" VARCHAR(255) NOT NULL,
    "module" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "role" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "role_permission" (
    "role_id" INTEGER NOT NULL,
    "permission_id" INTEGER NOT NULL,

    PRIMARY KEY ("role_id","permission_id")
);

-- CreateTable
CREATE TABLE "user_role" (
    "role_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,

    PRIMARY KEY ("role_id","user_id")
);

-- CreateTable
CREATE TABLE "employee" (
    "id" SERIAL NOT NULL,
    "first_name" TEXT NOT NULL,
    "middle_name" TEXT,
    "last_name" TEXT NOT NULL,
    "date_of_birth" TIMESTAMP(3) NOT NULL,
    "gender" "gender" NOT NULL,
    "salutation" TEXT NOT NULL,
    "joined_date" TIMESTAMP(3) NOT NULL,
    "employee_code" TEXT NOT NULL,
    "qr_code" TEXT,
    "emergency_person" TEXT NOT NULL,
    "emergency_contact" TEXT NOT NULL,
    "emergency_contact_relationship" TEXT NOT NULL,
    "image" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "gradeId" INTEGER,
    "healthInsuaranceId" INTEGER,
    "designationId" INTEGER NOT NULL,
    "departmentId" INTEGER NOT NULL,
    "employmentTypeId" INTEGER,
    "jobApplicantId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "emp_contact_details" (
    "id" SERIAL NOT NULL,
    "mobile_no" VARCHAR(255) NOT NULL,
    "personal_email" VARCHAR(255) NOT NULL,
    "company_email" VARCHAR(255) NOT NULL,
    "preffered_email" VARCHAR(255) NOT NULL,
    "current_addr" VARCHAR(255) NOT NULL,
    "current_accommodation_type" VARCHAR(255) NOT NULL,
    "permenant_addr" VARCHAR(255) NOT NULL,
    "permenant_accommodation_type" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "employeeId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "emp_personal_details" (
    "id" SERIAL NOT NULL,
    "nic" VARCHAR(255) NOT NULL,
    "marital_status" "marital_status" NOT NULL,
    "blood_group" VARCHAR(255) NOT NULL,
    "family_details" TEXT NOT NULL,
    "health_details" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "employeeId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "education_qualifications" (
    "id" SERIAL NOT NULL,
    "school_or_uni" VARCHAR(255) NOT NULL,
    "level" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "employeeId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "work_history" (
    "id" SERIAL NOT NULL,
    "comapny" VARCHAR(255) NOT NULL,
    "designation" VARCHAR(255) NOT NULL,
    "salary" VARCHAR(255) NOT NULL,
    "addr" VARCHAR(255) NOT NULL,
    "contact" VARCHAR(255) NOT NULL,
    "experience" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "employeeId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "grade" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "health_insuarance" (
    "id" SERIAL NOT NULL,
    "number" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "providerId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "health_insuarance_provider" (
    "id" SERIAL NOT NULL,
    "provider" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "designation" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "grade_id" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "skills_of_designation" (
    "id" SERIAL NOT NULL,
    "skill_id" INTEGER NOT NULL,
    "designation_id" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "skills" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "salary" (
    "id" SERIAL NOT NULL,
    "bank_name" VARCHAR(255) NOT NULL,
    "bank_account" VARCHAR(255) NOT NULL,
    "mode" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "employeeId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Department" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "employment_type" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "internal_work_history" (
    "id" SERIAL NOT NULL,
    "from_date" TIMESTAMP(3) NOT NULL,
    "to_date" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "employeeId" INTEGER NOT NULL,
    "designationId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "staffing_plan" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "from_date" TIMESTAMP(3) NOT NULL,
    "to_date" TIMESTAMP(3) NOT NULL,
    "estimated_budget" DECIMAL(18,2) NOT NULL,
    "department_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "staffing_plan_detail" (
    "id" SERIAL NOT NULL,
    "designationId" INTEGER NOT NULL,
    "no_of_positions" INTEGER NOT NULL,
    "position_cost" DECIMAL(18,2) NOT NULL,
    "estimated_cost" DECIMAL(18,2) NOT NULL,
    "current_openings" INTEGER NOT NULL DEFAULT 0,
    "current_count" INTEGER NOT NULL DEFAULT 0,
    "staffing_plan_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "jobOpened" BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "job_opening" (
    "id" SERIAL NOT NULL,
    "job_title" VARCHAR(100) NOT NULL,
    "status" VARCHAR(100) NOT NULL,
    "description" TEXT NOT NULL,
    "salary_range" VARCHAR(255) NOT NULL,
    "published" BOOLEAN NOT NULL DEFAULT false,
    "staffingPlanDetailId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "job_applicant_source" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "details" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "job_applicant" (
    "id" SERIAL NOT NULL,
    "applicant_name" VARCHAR(100) NOT NULL,
    "email" VARCHAR(200) NOT NULL,
    "status" "JobApplicantStatus" NOT NULL,
    "phone_number" VARCHAR(12) NOT NULL,
    "date_of_birth" TIMESTAMP(3) NOT NULL,
    "resume" VARCHAR(255) NOT NULL,
    "cover_letter" VARCHAR(255) NOT NULL,
    "gender" "gender" NOT NULL,
    "haveDegree" BOOLEAN DEFAULT false,
    "degree" VARCHAR(300),
    "passedAl" BOOLEAN DEFAULT false,
    "alResults" VARCHAR(250),
    "passedOls" BOOLEAN DEFAULT false,
    "workExperience" TEXT,
    "academicQualifications" TEXT,
    "remarks" TEXT,
    "jobOpeningId" INTEGER NOT NULL,
    "jobApplicantSourceId" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "job_offer" (
    "id" SERIAL NOT NULL,
    "status" "job_offer_status" NOT NULL,
    "offer_date" TIMESTAMP(3) NOT NULL,
    "description" TEXT NOT NULL,
    "applicantId" INTEGER NOT NULL,
    "designationId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "offer_term" (
    "id" SERIAL NOT NULL,
    "term" VARCHAR(255) NOT NULL,
    "description" VARCHAR(500) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "offer_term_of_job_offer" (
    "id" SERIAL NOT NULL,
    "value" VARCHAR(255) NOT NULL,
    "offer_term_id" INTEGER NOT NULL,
    "joboffer_id" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "appointment_letter" (
    "id" SERIAL NOT NULL,
    "body" TEXT NOT NULL,
    "jobApplicantId" INTEGER NOT NULL,
    "appointmentDate" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "custom_terms" (
    "id" SERIAL NOT NULL,
    "newName" INTEGER NOT NULL,
    "new_description" VARCHAR(255) NOT NULL,
    "letterId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "job_terms" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "onboarding" (
    "id" SERIAL NOT NULL,
    "joined_date" TIMESTAMP(3) NOT NULL,
    "assignedEmployee" TEXT NOT NULL,
    "status" "OnboardingStatus" NOT NULL,
    "jobApplicantId" INTEGER NOT NULL,
    "employeeId" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "onboarding_activity" (
    "id" SERIAL NOT NULL,
    "activity" TEXT NOT NULL,
    "onboardingId" INTEGER NOT NULL,
    "assignedEmployeeId" INTEGER,
    "activityStatus" "OnboardingStatus" NOT NULL DEFAULT E'pending',

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OnboardingActivities" (
    "id" SERIAL NOT NULL,
    "activity" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "promotion" (
    "id" SERIAL NOT NULL,
    "promotion_date" TIMESTAMP(3) NOT NULL,
    "employeeId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "promotion_details" (
    "id" SERIAL NOT NULL,
    "area" TEXT NOT NULL,
    "current_status" INTEGER NOT NULL,
    "new_status" INTEGER NOT NULL,
    "promotionId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "transfer" (
    "id" SERIAL NOT NULL,
    "transfer_date" TIMESTAMP(3) NOT NULL,
    "employeeId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "holiday_list" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "from_date" TIMESTAMP(3) NOT NULL,
    "to_date" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "isSaturdayHoliday" BOOLEAN NOT NULL DEFAULT false,
    "isSundayHoliday" BOOLEAN NOT NULL DEFAULT false,
    "totalHolidays" INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "holiday" (
    "id" SERIAL NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "description" VARCHAR(200) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "holidayListId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "transfer_details" (
    "id" SERIAL NOT NULL,
    "area" TEXT NOT NULL,
    "current_status" INTEGER NOT NULL,
    "new_status" INTEGER NOT NULL,
    "transferId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "seperation" (
    "id" SERIAL NOT NULL,
    "seperation_date" TIMESTAMP(3) NOT NULL,
    "assigned_employee" TEXT NOT NULL,
    "status" "SeperationStatus" NOT NULL,
    "employeeId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "separation_activity" (
    "id" SERIAL NOT NULL,
    "activity" TEXT NOT NULL,
    "seperationId" INTEGER NOT NULL,
    "assignedEmployeeId" INTEGER,
    "activtyStatus" "SeperationStatus" NOT NULL DEFAULT E'pending',

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SeperationActivities" (
    "id" SERIAL NOT NULL,
    "activity" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "notification" (
    "id" SERIAL NOT NULL,
    "message" TEXT NOT NULL,
    "link" TEXT,
    "read" BOOLEAN NOT NULL,
    "recieved_employee_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

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
    "trainingFeedbackId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "training_event" (
    "id" SERIAL NOT NULL,
    "eventName" VARCHAR(100) NOT NULL,
    "eventStatus" VARCHAR(100) NOT NULL,
    "start_time" TIMESTAMP(3) NOT NULL,
    "end_time" TIMESTAMP(3) NOT NULL,
    "trainerName" VARCHAR(100) NOT NULL,
    "trainerEmail" VARCHAR(100) NOT NULL,
    "trainerContactNo" INTEGER NOT NULL,
    "location" VARCHAR(100) NOT NULL,
    "level" VARCHAR(100) NOT NULL,
    "type" VARCHAR(100) NOT NULL,
    "introduction" VARCHAR(200) NOT NULL,
    "hasCertificate" BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "employee_training_event" (
    "status" VARCHAR(10) NOT NULL DEFAULT E'Scheduled',
    "attendance" BOOLEAN NOT NULL DEFAULT false,
    "isMandatory" BOOLEAN NOT NULL DEFAULT false,
    "employeeFeedback" VARCHAR(200) NOT NULL DEFAULT E'Pendding',
    "employeerating" INTEGER NOT NULL DEFAULT 0,
    "trainerComment" VARCHAR(200) NOT NULL DEFAULT E'Pendding',
    "trainerGrade" VARCHAR(1) NOT NULL DEFAULT E'Q',
    "employee_id" INTEGER NOT NULL,
    "training_event_id" INTEGER NOT NULL,

    PRIMARY KEY ("employee_id","training_event_id")
);

-- CreateTable
CREATE TABLE "leave_period" (
    "id" SERIAL NOT NULL,
    "from_date" TIMESTAMP(3) NOT NULL,
    "to_date" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "holidayListId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "leave_type" (
    "id" SERIAL NOT NULL,
    "typeName" VARCHAR(100) NOT NULL,
    "maxContinuousDays" INTEGER NOT NULL DEFAULT 0,
    "maxLeaves" INTEGER NOT NULL DEFAULT 0,
    "applicableAfter" INTEGER NOT NULL DEFAULT 0,
    "allowEncashment" BOOLEAN NOT NULL DEFAULT false,
    "encashmentThreshholdDays" INTEGER NOT NULL DEFAULT 0,
    "canCarryForward" BOOLEAN NOT NULL DEFAULT false,
    "maxCarryForward" INTEGER NOT NULL DEFAULT 0,
    "withoutPay" BOOLEAN NOT NULL DEFAULT false,
    "includeHoliday" BOOLEAN NOT NULL DEFAULT false,
    "isCompensatory" BOOLEAN NOT NULL DEFAULT false,
    "isEarnedLeave" BOOLEAN NOT NULL DEFAULT false,
    "earnedLeaveFreq" "earned_leave_frequency" NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "leave_policy" (
    "id" SERIAL NOT NULL,
    "code" VARCHAR(100) NOT NULL,
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
    "leavePolicyId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "shift_type" (
    "id" SERIAL NOT NULL,
    "shiftName" VARCHAR(100) NOT NULL,
    "startTime" VARCHAR(5) NOT NULL,
    "endTime" VARCHAR(5) NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "holidayListId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "shift_request" (
    "id" SERIAL NOT NULL,
    "start_date" TIMESTAMP(3) NOT NULL,
    "end_date" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "approver" VARCHAR(100) NOT NULL,
    "status" BOOLEAN NOT NULL DEFAULT false,
    "shiftTypeId" INTEGER NOT NULL,
    "employeeId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "shift_assignment" (
    "id" SERIAL NOT NULL,
    "approver" VARCHAR(100) NOT NULL,
    "start_date" TIMESTAMP(3) NOT NULL,
    "end_date" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "shiftTypeId" INTEGER NOT NULL,
    "employeeId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

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

-- CreateTable
CREATE TABLE "attendance" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "in_time" TIMESTAMP(3) NOT NULL,
    "out_time" TIMESTAMP(3) NOT NULL,
    "working_hours" DECIMAL(65,30) NOT NULL,
    "lateEntry" BOOLEAN NOT NULL DEFAULT false,
    "earlyExit" BOOLEAN NOT NULL DEFAULT false,
    "status" VARCHAR(255) NOT NULL,
    "employeeId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "attendance_request" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "to_date" TIMESTAMP(3) NOT NULL,
    "from_date" TIMESTAMP(3) NOT NULL,
    "reason" VARCHAR(255) NOT NULL,
    "explanation" VARCHAR(255) NOT NULL,
    "employeeId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "attendance_request_details" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "halfOrFull" VARCHAR(10) NOT NULL,
    "attendanceRequestId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

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
    "new_leaves_alocated" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "total_leaves_alocated" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "employee_id" INTEGER NOT NULL,
    "leave_type_id" INTEGER NOT NULL,
    "leave_policy_assignment_id" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "employee_check_in" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "time" TIMESTAMP(3) NOT NULL,
    "inOut" VARCHAR(255) NOT NULL,
    "employeeId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "responsibilities" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "departmentId" INTEGER NOT NULL,
    "designationId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "responsibility_allocation" (
    "id" SERIAL NOT NULL,
    "responsibilityId" INTEGER NOT NULL,
    "weightage" INTEGER NOT NULL,
    "score" INTEGER NOT NULL,
    "comments" TEXT,
    "status" "ResponsibilityStatus" NOT NULL,
    "expected" INTEGER,
    "completed" INTEGER,
    "deadline" TIMESTAMP(3) NOT NULL,
    "dateCompleted" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "assignedEmployeeId" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ResponsibilityTemplate" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "designationId" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ResponsibilitiesOfTemplate" (
    "id" SERIAL NOT NULL,
    "templateId" INTEGER NOT NULL,
    "responsibilityId" INTEGER NOT NULL,
    "expected" INTEGER,
    "weightage" INTEGER NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user.email_unique" ON "user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "user_employeeId_unique" ON "user"("employeeId");

-- CreateIndex
CREATE UNIQUE INDEX "role.name_unique" ON "role"("name");

-- CreateIndex
CREATE UNIQUE INDEX "employee_jobApplicantId_unique" ON "employee"("jobApplicantId");

-- CreateIndex
CREATE UNIQUE INDEX "emp_contact_details_employeeId_unique" ON "emp_contact_details"("employeeId");

-- CreateIndex
CREATE UNIQUE INDEX "emp_personal_details_employeeId_unique" ON "emp_personal_details"("employeeId");

-- CreateIndex
CREATE UNIQUE INDEX "education_qualifications_employeeId_unique" ON "education_qualifications"("employeeId");

-- CreateIndex
CREATE UNIQUE INDEX "work_history_employeeId_unique" ON "work_history"("employeeId");

-- CreateIndex
CREATE UNIQUE INDEX "grade.name_unique" ON "grade"("name");

-- CreateIndex
CREATE UNIQUE INDEX "health_insuarance.number_unique" ON "health_insuarance"("number");

-- CreateIndex
CREATE UNIQUE INDEX "health_insuarance_provider.provider_unique" ON "health_insuarance_provider"("provider");

-- CreateIndex
CREATE UNIQUE INDEX "designation.name_unique" ON "designation"("name");

-- CreateIndex
CREATE UNIQUE INDEX "skills.name_unique" ON "skills"("name");

-- CreateIndex
CREATE UNIQUE INDEX "salary_employeeId_unique" ON "salary"("employeeId");

-- CreateIndex
CREATE UNIQUE INDEX "internal_work_history_employeeId_unique" ON "internal_work_history"("employeeId");

-- CreateIndex
CREATE UNIQUE INDEX "job_offer_applicantId_unique" ON "job_offer"("applicantId");

-- CreateIndex
CREATE UNIQUE INDEX "appointment_letter_jobApplicantId_unique" ON "appointment_letter"("jobApplicantId");

-- CreateIndex
CREATE UNIQUE INDEX "onboarding_jobApplicantId_unique" ON "onboarding"("jobApplicantId");

-- CreateIndex
CREATE UNIQUE INDEX "onboarding_employeeId_unique" ON "onboarding"("employeeId");

-- CreateIndex
CREATE UNIQUE INDEX "seperation_employeeId_unique" ON "seperation"("employeeId");

-- CreateIndex
CREATE UNIQUE INDEX "leave_period_holidayListId_unique" ON "leave_period"("holidayListId");

-- CreateIndex
CREATE UNIQUE INDEX "shift_type_holidayListId_unique" ON "shift_type"("holidayListId");

-- CreateIndex
CREATE UNIQUE INDEX "company_holidayListId_unique" ON "company"("holidayListId");

-- AddForeignKey
ALTER TABLE "user" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "role_permission" ADD FOREIGN KEY ("role_id") REFERENCES "role"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "role_permission" ADD FOREIGN KEY ("permission_id") REFERENCES "permission"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_role" ADD FOREIGN KEY ("role_id") REFERENCES "role"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_role" ADD FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee" ADD FOREIGN KEY ("gradeId") REFERENCES "grade"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee" ADD FOREIGN KEY ("healthInsuaranceId") REFERENCES "health_insuarance"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee" ADD FOREIGN KEY ("designationId") REFERENCES "designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee" ADD FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee" ADD FOREIGN KEY ("employmentTypeId") REFERENCES "employment_type"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee" ADD FOREIGN KEY ("jobApplicantId") REFERENCES "job_applicant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "emp_contact_details" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "emp_personal_details" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "education_qualifications" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "work_history" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "health_insuarance" ADD FOREIGN KEY ("providerId") REFERENCES "health_insuarance_provider"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "designation" ADD FOREIGN KEY ("grade_id") REFERENCES "grade"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "skills_of_designation" ADD FOREIGN KEY ("skill_id") REFERENCES "skills"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "skills_of_designation" ADD FOREIGN KEY ("designation_id") REFERENCES "designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "salary" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "internal_work_history" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "internal_work_history" ADD FOREIGN KEY ("designationId") REFERENCES "designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "staffing_plan" ADD FOREIGN KEY ("department_id") REFERENCES "Department"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "staffing_plan_detail" ADD FOREIGN KEY ("designationId") REFERENCES "designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "staffing_plan_detail" ADD FOREIGN KEY ("staffing_plan_id") REFERENCES "staffing_plan"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "job_opening" ADD FOREIGN KEY ("staffingPlanDetailId") REFERENCES "staffing_plan_detail"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "job_applicant" ADD FOREIGN KEY ("jobOpeningId") REFERENCES "job_opening"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "job_applicant" ADD FOREIGN KEY ("jobApplicantSourceId") REFERENCES "job_applicant_source"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "job_offer" ADD FOREIGN KEY ("applicantId") REFERENCES "job_applicant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "job_offer" ADD FOREIGN KEY ("designationId") REFERENCES "designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "offer_term_of_job_offer" ADD FOREIGN KEY ("offer_term_id") REFERENCES "offer_term"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "offer_term_of_job_offer" ADD FOREIGN KEY ("joboffer_id") REFERENCES "job_offer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "appointment_letter" ADD FOREIGN KEY ("jobApplicantId") REFERENCES "job_applicant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "custom_terms" ADD FOREIGN KEY ("newName") REFERENCES "job_terms"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "custom_terms" ADD FOREIGN KEY ("letterId") REFERENCES "appointment_letter"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "onboarding" ADD FOREIGN KEY ("jobApplicantId") REFERENCES "job_applicant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "onboarding" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "onboarding_activity" ADD FOREIGN KEY ("onboardingId") REFERENCES "onboarding"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "onboarding_activity" ADD FOREIGN KEY ("assignedEmployeeId") REFERENCES "employee"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "promotion" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "promotion_details" ADD FOREIGN KEY ("current_status") REFERENCES "designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "promotion_details" ADD FOREIGN KEY ("new_status") REFERENCES "designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "promotion_details" ADD FOREIGN KEY ("promotionId") REFERENCES "promotion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transfer" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "holiday" ADD FOREIGN KEY ("holidayListId") REFERENCES "holiday_list"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transfer_details" ADD FOREIGN KEY ("current_status") REFERENCES "Department"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transfer_details" ADD FOREIGN KEY ("new_status") REFERENCES "Department"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transfer_details" ADD FOREIGN KEY ("transferId") REFERENCES "transfer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "seperation" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "separation_activity" ADD FOREIGN KEY ("seperationId") REFERENCES "seperation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "separation_activity" ADD FOREIGN KEY ("assignedEmployeeId") REFERENCES "employee"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notification" ADD FOREIGN KEY ("recieved_employee_id") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SkillMap" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SkillDetails" ADD FOREIGN KEY ("skillId") REFERENCES "skills_of_designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SkillDetails" ADD FOREIGN KEY ("skillMapId") REFERENCES "SkillMap"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingDetails" ADD FOREIGN KEY ("skillMapId") REFERENCES "SkillMap"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingDetails" ADD FOREIGN KEY ("trainingEventId") REFERENCES "training_event"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee_training_event" ADD FOREIGN KEY ("employee_id") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee_training_event" ADD FOREIGN KEY ("training_event_id") REFERENCES "training_event"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "leave_period" ADD FOREIGN KEY ("holidayListId") REFERENCES "holiday_list"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "leave_policy_detail" ADD FOREIGN KEY ("leaveTypeId") REFERENCES "leave_type"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "leave_policy_detail" ADD FOREIGN KEY ("leavePolicyId") REFERENCES "leave_policy"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "shift_type" ADD FOREIGN KEY ("holidayListId") REFERENCES "holiday_list"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "shift_request" ADD FOREIGN KEY ("shiftTypeId") REFERENCES "shift_type"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "shift_request" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "shift_assignment" ADD FOREIGN KEY ("shiftTypeId") REFERENCES "shift_type"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "shift_assignment" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "leave_application" ADD FOREIGN KEY ("leaveTypeId") REFERENCES "leave_type"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "leave_application" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "leave_application_detail" ADD FOREIGN KEY ("leaveApplicationId") REFERENCES "leave_application"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "company" ADD FOREIGN KEY ("holidayListId") REFERENCES "holiday_list"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attendance" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attendance_request" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attendance_request_details" ADD FOREIGN KEY ("attendanceRequestId") REFERENCES "attendance_request"("id") ON DELETE CASCADE ON UPDATE CASCADE;

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

-- AddForeignKey
ALTER TABLE "employee_check_in" ADD FOREIGN KEY ("employeeId") REFERENCES "employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "responsibilities" ADD FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "responsibilities" ADD FOREIGN KEY ("designationId") REFERENCES "designation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "responsibility_allocation" ADD FOREIGN KEY ("responsibilityId") REFERENCES "responsibilities"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "responsibility_allocation" ADD FOREIGN KEY ("assignedEmployeeId") REFERENCES "employee"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResponsibilitiesOfTemplate" ADD FOREIGN KEY ("templateId") REFERENCES "ResponsibilityTemplate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResponsibilitiesOfTemplate" ADD FOREIGN KEY ("responsibilityId") REFERENCES "responsibilities"("id") ON DELETE CASCADE ON UPDATE CASCADE;
