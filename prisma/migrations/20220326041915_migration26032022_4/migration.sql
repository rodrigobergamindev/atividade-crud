/*
  Warnings:

  - Added the required column `photoUrl` to the `Devotional` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Devotional" ADD COLUMN     "photoUrl" TEXT NOT NULL;
