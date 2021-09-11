/*
  Warnings:

  - You are about to drop the column `route` on the `permission` table. All the data in the column will be lost.
  - Added the required column `backend_route` to the `permission` table without a default value. This is not possible if the table is not empty.
  - Added the required column `frontend_route` to the `permission` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "permission" DROP COLUMN "route",
ADD COLUMN     "backend_route" VARCHAR(255) NOT NULL,
ADD COLUMN     "frontend_route" VARCHAR(255) NOT NULL;
