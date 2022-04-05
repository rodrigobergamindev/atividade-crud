/*
  Warnings:

  - You are about to drop the column `description` on the `PrayerComment` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[prayerId,authorId]` on the table `PrayerComment` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `authorId` to the `PrayerComment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `message` to the `PrayerComment` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Prayer" DROP CONSTRAINT "Prayer_authorId_fkey";

-- DropForeignKey
ALTER TABLE "PrayerComment" DROP CONSTRAINT "PrayerComment_prayerId_fkey";

-- AlterTable
ALTER TABLE "Prayer" ADD COLUMN     "photoUrl" TEXT;

-- AlterTable
ALTER TABLE "PrayerComment" DROP COLUMN "description",
ADD COLUMN     "authorId" TEXT NOT NULL,
ADD COLUMN     "message" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "PrayerComment_prayerId_authorId_key" ON "PrayerComment"("prayerId", "authorId");

-- AddForeignKey
ALTER TABLE "Prayer" ADD CONSTRAINT "Prayer_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PrayerComment" ADD CONSTRAINT "PrayerComment_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PrayerComment" ADD CONSTRAINT "PrayerComment_prayerId_fkey" FOREIGN KEY ("prayerId") REFERENCES "Prayer"("id") ON DELETE CASCADE ON UPDATE CASCADE;
