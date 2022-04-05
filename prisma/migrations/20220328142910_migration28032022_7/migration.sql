/*
  Warnings:

  - You are about to drop the column `categoryId` on the `Prayer` table. All the data in the column will be lost.
  - The primary key for the `PrayerCategory` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `PrayerCategory` table. All the data in the column will be lost.
  - Added the required column `categoryTitle` to the `Prayer` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Prayer" DROP CONSTRAINT "Prayer_categoryId_fkey";

-- AlterTable
ALTER TABLE "Prayer" DROP COLUMN "categoryId",
ADD COLUMN     "categoryTitle" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "PrayerCategory" DROP CONSTRAINT "PrayerCategory_pkey",
DROP COLUMN "id",
ADD CONSTRAINT "PrayerCategory_pkey" PRIMARY KEY ("title");

-- AddForeignKey
ALTER TABLE "Prayer" ADD CONSTRAINT "Prayer_categoryTitle_fkey" FOREIGN KEY ("categoryTitle") REFERENCES "PrayerCategory"("title") ON DELETE CASCADE ON UPDATE CASCADE;
