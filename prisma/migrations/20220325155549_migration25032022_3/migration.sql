/*
  Warnings:

  - You are about to drop the `Event` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "SubscriptionEvent" DROP CONSTRAINT "SubscriptionEvent_eventId_fkey";

-- DropTable
DROP TABLE "Event";

-- CreateTable
CREATE TABLE "EventChurch" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "time" TEXT NOT NULL,
    "photoUrl" TEXT,

    CONSTRAINT "EventChurch_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "SubscriptionEvent" ADD CONSTRAINT "SubscriptionEvent_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES "EventChurch"("id") ON DELETE CASCADE ON UPDATE CASCADE;
