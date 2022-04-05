/*
  Warnings:

  - You are about to drop the column `likes` on the `Prayer` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Prayer" DROP CONSTRAINT "Prayer_categoryId_fkey";

-- AlterTable
ALTER TABLE "Prayer" DROP COLUMN "likes";

-- CreateTable
CREATE TABLE "Like" (
    "authorId" TEXT NOT NULL,
    "prayerId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateIndex
CREATE UNIQUE INDEX "Like_authorId_prayerId_key" ON "Like"("authorId", "prayerId");

-- AddForeignKey
ALTER TABLE "Prayer" ADD CONSTRAINT "Prayer_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "PrayerCategory"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Like" ADD CONSTRAINT "Like_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Like" ADD CONSTRAINT "Like_prayerId_fkey" FOREIGN KEY ("prayerId") REFERENCES "Prayer"("id") ON DELETE CASCADE ON UPDATE CASCADE;
