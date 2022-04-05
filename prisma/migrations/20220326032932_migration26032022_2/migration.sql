/*
  Warnings:

  - A unique constraint covering the columns `[dates,time]` on the table `Plan` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Plan_dates_time_key" ON "Plan"("dates", "time");
