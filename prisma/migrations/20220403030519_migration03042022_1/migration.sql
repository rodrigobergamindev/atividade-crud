/*
  Warnings:

  - You are about to drop the column `hashRefreshToken` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `hashToken` on the `User` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "User" DROP COLUMN "hashRefreshToken",
DROP COLUMN "hashToken";

-- CreateTable
CREATE TABLE "Contribuition" (
    "id" TEXT NOT NULL,
    "authorId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "value" TEXT NOT NULL,
    "theme" TEXT NOT NULL,

    CONSTRAINT "Contribuition_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Contribuition" ADD CONSTRAINT "Contribuition_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
