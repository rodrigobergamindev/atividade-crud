/*
  Warnings:

  - You are about to drop the column `data` on the `Devotional` table. All the data in the column will be lost.
  - Added the required column `date` to the `Devotional` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Devotional" DROP COLUMN "data",
ADD COLUMN     "date" TEXT NOT NULL;
