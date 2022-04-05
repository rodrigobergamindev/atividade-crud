/*
  Warnings:

  - A unique constraint covering the columns `[date,time]` on the table `ReunionPG` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "ReunionPG_date_time_key" ON "ReunionPG"("date", "time");
