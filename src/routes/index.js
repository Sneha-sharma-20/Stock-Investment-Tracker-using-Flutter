import express from 'express';

export const router = express.Router();

router.get('/', (req, res) => {
  res.json({ message: 'Welcome to the API' });
});

router.get('/health', (req, res) => {
  res.json({ status: 'healthy' });
});