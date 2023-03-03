import { Router } from "express";
import { validateSchema } from "../middlewares/validateSchema.js";
import { autenticationToken } from "../middlewares/validateTolken.js";
import { urlSchema } from '../schemas/urlSchema.js'
import { shorten } from '../controllers/urlsController.js'



const urlsRoute = Router()

urlsRoute.use(autenticationToken);

urlsRoute.post("/urls/shorten", validateSchema(urlSchema), shorten)


export default urlsRoute