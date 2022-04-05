/*
  Warnings:

  - You are about to drop the column `hashAccessToken` on the `User` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "User" DROP COLUMN "hashAccessToken",
ADD COLUMN     "hashToken" TEXT;
