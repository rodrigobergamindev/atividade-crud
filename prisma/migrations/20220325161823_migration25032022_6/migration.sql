/*
  Warnings:

  - A unique constraint covering the columns `[date,start,end]` on the table `EventChurch` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "EventChurch_date_start_end_key" ON "EventChurch"("date", "start", "end");
