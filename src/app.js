import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv'
import authRoute from './routes/authRoute.js';
import urlsRoute from './routes/urlsRoute.js';
import usersRoute from './routes/usersRoute.js';

dotenv.config();

const app = express();

app.use(cors());

app.use(express.json());

app.use(authRoute, urlsRoute, usersRoute)

app.listen(process.env.PORT, () => console.log("Server is up on port:" + process.env.PORT));
