-- CreateEnum
CREATE TYPE "Role" AS ENUM ('VISITANTE', 'ADMIN', 'MEMBRO', 'PASTOR', 'PRESBITERO', 'DIACONO', 'MISSIONARIO');

-- CreateEnum
CREATE TYPE "TypeChurch" AS ENUM ('CONGREGACAO', 'SEDE', 'SUPERINTENDENCIA');

-- CreateEnum
CREATE TYPE "Status" AS ENUM ('PENDING', 'ACCEPTED');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT E'VISITANTE',
    "birth" TEXT NOT NULL,
    "churchName" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "photoUrl" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SubscriptionMinistry" (
    "id" TEXT NOT NULL,
    "status" "Status" NOT NULL DEFAULT E'PENDING',
    "memberId" TEXT NOT NULL,
    "ministryId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SubscriptionMinistry_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SubscriptionPG" (
    "id" TEXT NOT NULL,
    "status" "Status" NOT NULL DEFAULT E'PENDING',
    "memberId" TEXT NOT NULL,
    "pgId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SubscriptionPG_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CoordinationMinistry" (
    "id" TEXT NOT NULL,
    "coordinatorId" TEXT NOT NULL,
    "ministryId" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "photoUrl" TEXT,

    CONSTRAINT "CoordinationMinistry_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ministry" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "photoUrl" TEXT,

    CONSTRAINT "Ministry_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserAddress" (
    "id" TEXT NOT NULL,
    "place" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "complement" TEXT,
    "zipCode" TEXT NOT NULL,
    "district" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "UserAddress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ChurchAddress" (
    "id" TEXT NOT NULL,
    "place" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "complement" TEXT,
    "zipCode" TEXT NOT NULL,
    "district" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "churchId" TEXT NOT NULL,

    CONSTRAINT "ChurchAddress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Church" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "type" "TypeChurch" NOT NULL,
    "photo" TEXT,

    CONSTRAINT "Church_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Video" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "photo" TEXT NOT NULL,

    CONSTRAINT "Video_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cult" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "photo" TEXT,

    CONSTRAINT "Cult_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Plan" (
    "id" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "time" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Plan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Prayer" (
    "id" TEXT NOT NULL,
    "categoryId" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "authorId" TEXT NOT NULL,
    "likes" INTEGER,

    CONSTRAINT "Prayer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PrayerCategory" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,

    CONSTRAINT "PrayerCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PrayerComment" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "prayerId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PrayerComment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Event" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "time" TEXT NOT NULL,

    CONSTRAINT "Event_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SubscriptionEvent" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "eventId" TEXT NOT NULL,

    CONSTRAINT "SubscriptionEvent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Devotional" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "data" TEXT NOT NULL,
    "author" TEXT NOT NULL,

    CONSTRAINT "Devotional_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CoordinationPG" (
    "id" TEXT NOT NULL,
    "coordinatorId" TEXT NOT NULL,
    "pgId" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "photoUrl" TEXT,

    CONSTRAINT "CoordinationPG_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PG" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "reunionDate" TEXT NOT NULL,
    "photo" TEXT NOT NULL,

    CONSTRAINT "PG_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PGCategoryTheme" (
    "id" TEXT NOT NULL,
    "categoryId" TEXT NOT NULL,
    "pgId" TEXT NOT NULL,

    CONSTRAINT "PGCategoryTheme_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PGCategory" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,

    CONSTRAINT "PGCategory_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "SubscriptionPG_memberId_key" ON "SubscriptionPG"("memberId");

-- CreateIndex
CREATE UNIQUE INDEX "CoordinationMinistry_email_key" ON "CoordinationMinistry"("email");

-- CreateIndex
CREATE UNIQUE INDEX "CoordinationMinistry_ministryId_key" ON "CoordinationMinistry"("ministryId");

-- CreateIndex
CREATE UNIQUE INDEX "Ministry_name_key" ON "Ministry"("name");

-- CreateIndex
CREATE UNIQUE INDEX "UserAddress_userId_key" ON "UserAddress"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "ChurchAddress_churchId_key" ON "ChurchAddress"("churchId");

-- CreateIndex
CREATE UNIQUE INDEX "Church_name_key" ON "Church"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Plan_userId_key" ON "Plan"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "CoordinationPG_email_key" ON "CoordinationPG"("email");

-- CreateIndex
CREATE UNIQUE INDEX "CoordinationPG_coordinatorId_key" ON "CoordinationPG"("coordinatorId");

-- CreateIndex
CREATE UNIQUE INDEX "CoordinationPG_pgId_key" ON "CoordinationPG"("pgId");

-- CreateIndex
CREATE UNIQUE INDEX "PG_name_key" ON "PG"("name");

-- CreateIndex
CREATE UNIQUE INDEX "PGCategory_title_key" ON "PGCategory"("title");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_churchName_fkey" FOREIGN KEY ("churchName") REFERENCES "Church"("name") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubscriptionMinistry" ADD CONSTRAINT "SubscriptionMinistry_memberId_fkey" FOREIGN KEY ("memberId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubscriptionMinistry" ADD CONSTRAINT "SubscriptionMinistry_ministryId_fkey" FOREIGN KEY ("ministryId") REFERENCES "Ministry"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubscriptionPG" ADD CONSTRAINT "SubscriptionPG_memberId_fkey" FOREIGN KEY ("memberId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubscriptionPG" ADD CONSTRAINT "SubscriptionPG_pgId_fkey" FOREIGN KEY ("pgId") REFERENCES "PG"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoordinationMinistry" ADD CONSTRAINT "CoordinationMinistry_coordinatorId_fkey" FOREIGN KEY ("coordinatorId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoordinationMinistry" ADD CONSTRAINT "CoordinationMinistry_ministryId_fkey" FOREIGN KEY ("ministryId") REFERENCES "Ministry"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserAddress" ADD CONSTRAINT "UserAddress_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChurchAddress" ADD CONSTRAINT "ChurchAddress_churchId_fkey" FOREIGN KEY ("churchId") REFERENCES "Church"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Plan" ADD CONSTRAINT "Plan_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Prayer" ADD CONSTRAINT "Prayer_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Prayer" ADD CONSTRAINT "Prayer_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "PrayerCategory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PrayerComment" ADD CONSTRAINT "PrayerComment_prayerId_fkey" FOREIGN KEY ("prayerId") REFERENCES "Prayer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubscriptionEvent" ADD CONSTRAINT "SubscriptionEvent_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubscriptionEvent" ADD CONSTRAINT "SubscriptionEvent_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES "Event"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoordinationPG" ADD CONSTRAINT "CoordinationPG_coordinatorId_fkey" FOREIGN KEY ("coordinatorId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoordinationPG" ADD CONSTRAINT "CoordinationPG_pgId_fkey" FOREIGN KEY ("pgId") REFERENCES "PG"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PGCategoryTheme" ADD CONSTRAINT "PGCategoryTheme_pgId_fkey" FOREIGN KEY ("pgId") REFERENCES "PG"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PGCategoryTheme" ADD CONSTRAINT "PGCategoryTheme_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "PGCategory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
