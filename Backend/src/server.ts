import express from 'express';
import { db } from './lib/prisma.js'; // Ajuste o nome se mudar o arquivo

const app = express();
app.use(express.json());

app.get('/usuarios', (req, res) => {
  try {
    // SQL Puro - rápido e sem erros de engine
    const users = db.prepare('SELECT * FROM users').all();
    res.json(users);
  } catch (error) {
    res.status(500).json({ error: "Erro ao consultar o banco" });
  }
});

app.listen(3333, () => console.log("🚀 Servidor com SQLite3 rodando em http://localhost:3333"));