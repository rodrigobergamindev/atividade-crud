/*
  Warnings:

  - You are about to drop the column `pgName` on the `CoordinationPG` table. All the data in the column will be lost.
  - The primary key for the `PG` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `PGCategoryTheme` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `pgName` on the `PGCategoryTheme` table. All the data in the column will be lost.
  - You are about to drop the column `pgName` on the `ReunionPG` table. All the data in the column will be lost.
  - You are about to drop the column `pgName` on the `SubscriptionPG` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[pgId]` on the table `CoordinationPG` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `pgId` to the `CoordinationPG` table without a default value. This is not possible if the table is not empty.
  - The required column `id` was added to the `PG` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `pgId` to the `PGCategoryTheme` table without a default value. This is not possible if the table is not empty.
  - Added the required column `pgId` to the `ReunionPG` table without a default value. This is not possible if the table is not empty.
  - Added the required column `pgId` to the `SubscriptionPG` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "CoordinationPG" DROP CONSTRAINT "CoordinationPG_pgName_fkey";

-- DropForeignKey
ALTER TABLE "PGCategoryTheme" DROP CONSTRAINT "PGCategoryTheme_pgName_fkey";

-- DropForeignKey
ALTER TABLE "ReunionPG" DROP CONSTRAINT "ReunionPG_pgName_fkey";

-- DropForeignKey
ALTER TABLE "SubscriptionPG" DROP CONSTRAINT "SubscriptionPG_pgName_fkey";

-- DropIndex
DROP INDEX "CoordinationPG_pgName_key";

-- AlterTable
ALTER TABLE "CoordinationPG" DROP COLUMN "pgName",
ADD COLUMN     "pgId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "PG" DROP CONSTRAINT "PG_pkey",
ADD COLUMN     "id" TEXT NOT NULL,
ADD CONSTRAINT "PG_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "PGCategoryTheme" DROP CONSTRAINT "PGCategoryTheme_pkey",
DROP COLUMN "pgName",
ADD COLUMN     "pgId" TEXT NOT NULL,
ADD CONSTRAINT "PGCategoryTheme_pkey" PRIMARY KEY ("categoryTitle", "pgId");

-- AlterTable
ALTER TABLE "ReunionPG" DROP COLUMN "pgName",
ADD COLUMN     "pgId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "SubscriptionPG" DROP COLUMN "pgName",
ADD COLUMN     "pgId" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "CoordinationPG_pgId_key" ON "CoordinationPG"("pgId");

-- AddForeignKey
ALTER TABLE "CoordinationPG" ADD CONSTRAINT "CoordinationPG_pgId_fkey" FOREIGN KEY ("pgId") REFERENCES "PG"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubscriptionPG" ADD CONSTRAINT "SubscriptionPG_pgId_fkey" FOREIGN KEY ("pgId") REFERENCES "PG"("name") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReunionPG" ADD CONSTRAINT "ReunionPG_pgId_fkey" FOREIGN KEY ("pgId") REFERENCES "PG"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PGCategoryTheme" ADD CONSTRAINT "PGCategoryTheme_pgId_fkey" FOREIGN KEY ("pgId") REFERENCES "PG"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
