/*
  Warnings:

  - A unique constraint covering the columns `[title]` on the table `PrayerCategory` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "PrayerCategory_title_key" ON "PrayerCategory"("title");
