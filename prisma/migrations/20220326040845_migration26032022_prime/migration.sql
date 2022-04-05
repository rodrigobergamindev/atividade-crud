/*
  Warnings:

  - A unique constraint covering the columns `[title,author,date]` on the table `Devotional` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Devotional_title_author_date_key" ON "Devotional"("title", "author", "date");
