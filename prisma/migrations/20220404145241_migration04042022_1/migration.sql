/*
  Warnings:

  - A unique constraint covering the columns `[dates,time,userId]` on the table `Plan` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "Plan_dates_time_key";

-- CreateIndex
CREATE UNIQUE INDEX "Plan_dates_time_userId_key" ON "Plan"("dates", "time", "userId");
