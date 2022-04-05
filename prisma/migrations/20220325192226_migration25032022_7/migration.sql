/*
  Warnings:

  - You are about to drop the column `date` on the `Plan` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Plan" DROP COLUMN "date",
ADD COLUMN     "dates" INTEGER[];
