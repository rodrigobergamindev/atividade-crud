-- DropForeignKey
ALTER TABLE "SubscriptionPG" DROP CONSTRAINT "SubscriptionPG_pgId_fkey";

-- AddForeignKey
ALTER TABLE "SubscriptionPG" ADD CONSTRAINT "SubscriptionPG_pgId_fkey" FOREIGN KEY ("pgId") REFERENCES "PG"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
