/*
  Warnings:

  - You are about to drop the column `adress` on the `Employee` table. All the data in the column will be lost.
  - Added the required column `address` to the `Employee` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Employee" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "fistName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "age" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    CONSTRAINT "Employee_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Employee" ("age", "fistName", "id", "lastName", "userId") SELECT "age", "fistName", "id", "lastName", "userId" FROM "Employee";
DROP TABLE "Employee";
ALTER TABLE "new_Employee" RENAME TO "Employee";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
