/*
  Warnings:

  - You are about to drop the column `pgId` on the `CoordinationPG` table. All the data in the column will be lost.
  - The primary key for the `PG` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `PG` table. All the data in the column will be lost.
  - The primary key for the `PGCategory` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `PGCategory` table. All the data in the column will be lost.
  - The primary key for the `PGCategoryTheme` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `categoryId` on the `PGCategoryTheme` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `PGCategoryTheme` table. All the data in the column will be lost.
  - You are about to drop the column `pgId` on the `PGCategoryTheme` table. All the data in the column will be lost.
  - You are about to drop the column `pgId` on the `SubscriptionPG` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[pgName]` on the table `CoordinationPG` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `pgName` to the `CoordinationPG` table without a default value. This is not possible if the table is not empty.
  - Added the required column `categoryTitle` to the `PGCategoryTheme` table without a default value. This is not possible if the table is not empty.
  - Added the required column `pgName` to the `PGCategoryTheme` table without a default value. This is not possible if the table is not empty.
  - Added the required column `pgName` to the `SubscriptionPG` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "CoordinationPG" DROP CONSTRAINT "CoordinationPG_pgId_fkey";

-- DropForeignKey
ALTER TABLE "PGCategoryTheme" DROP CONSTRAINT "PGCategoryTheme_categoryId_fkey";

-- DropForeignKey
ALTER TABLE "PGCategoryTheme" DROP CONSTRAINT "PGCategoryTheme_pgId_fkey";

-- DropForeignKey
ALTER TABLE "SubscriptionPG" DROP CONSTRAINT "SubscriptionPG_pgId_fkey";

-- DropIndex
DROP INDEX "CoordinationPG_pgId_key";

-- AlterTable
ALTER TABLE "CoordinationPG" DROP COLUMN "pgId",
ADD COLUMN     "pgName" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "PG" DROP CONSTRAINT "PG_pkey",
DROP COLUMN "id",
ADD CONSTRAINT "PG_pkey" PRIMARY KEY ("name");

-- AlterTable
ALTER TABLE "PGCategory" DROP CONSTRAINT "PGCategory_pkey",
DROP COLUMN "id",
ADD CONSTRAINT "PGCategory_pkey" PRIMARY KEY ("title");

-- AlterTable
ALTER TABLE "PGCategoryTheme" DROP CONSTRAINT "PGCategoryTheme_pkey",
DROP COLUMN "categoryId",
DROP COLUMN "id",
DROP COLUMN "pgId",
ADD COLUMN     "categoryTitle" TEXT NOT NULL,
ADD COLUMN     "pgName" TEXT NOT NULL,
ADD CONSTRAINT "PGCategoryTheme_pkey" PRIMARY KEY ("categoryTitle", "pgName");

-- AlterTable
ALTER TABLE "SubscriptionPG" DROP COLUMN "pgId",
ADD COLUMN     "pgName" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "CoordinationPG_pgName_key" ON "CoordinationPG"("pgName");

-- AddForeignKey
ALTER TABLE "CoordinationPG" ADD CONSTRAINT "CoordinationPG_pgName_fkey" FOREIGN KEY ("pgName") REFERENCES "PG"("name") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubscriptionPG" ADD CONSTRAINT "SubscriptionPG_pgName_fkey" FOREIGN KEY ("pgName") REFERENCES "PG"("name") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PGCategoryTheme" ADD CONSTRAINT "PGCategoryTheme_pgName_fkey" FOREIGN KEY ("pgName") REFERENCES "PG"("name") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PGCategoryTheme" ADD CONSTRAINT "PGCategoryTheme_categoryTitle_fkey" FOREIGN KEY ("categoryTitle") REFERENCES "PGCategory"("title") ON DELETE RESTRICT ON UPDATE CASCADE;
