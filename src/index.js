import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import { router } from './routes/index.js';
import { errorHandler } from './middleware/errorHandler.js';

const app = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(helmet());
app.use(cors());
app.use(express.json());

// Routes
app.use('/api', router);

// Error handling
app.use(errorHandler);

// Start server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});