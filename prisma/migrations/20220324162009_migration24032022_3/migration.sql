/*
  Warnings:

  - You are about to drop the column `photo` on the `PG` table. All the data in the column will be lost.
  - Added the required column `photoUrl` to the `PG` table without a default value. This is not possible if the table is not empty.
  - Added the required column `time` to the `PG` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "PG" DROP COLUMN "photo",
ADD COLUMN     "photoUrl" TEXT NOT NULL,
ADD COLUMN     "time" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "ReunionPG" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "time" TEXT NOT NULL,
    "pgName" TEXT NOT NULL,
    "material" TEXT NOT NULL,

    CONSTRAINT "ReunionPG_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ReunionPG" ADD CONSTRAINT "ReunionPG_pgName_fkey" FOREIGN KEY ("pgName") REFERENCES "PG"("name") ON DELETE RESTRICT ON UPDATE CASCADE;
