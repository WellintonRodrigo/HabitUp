import DatabaseConstructor, { type Database }from "better-sqlite3";
import path from "path";

const dbPath = path.resolve(__dirname, '../../prisma/dev.db');

export const db: Database= new DatabaseConstructor(dbPath, {verbose: console.log});

export function getUser(id: number) {
  const statement = db.prepare('SELECT * FROM users WHERE id = ?');
  return statement.get(id);
}