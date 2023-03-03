import { Router } from "express";
import { validateSchema } from "../middlewares/validateSchema.js";
import { autenticationToken } from "../middlewares/validateTolken.js";
import { urlSchema } from '../schemas/urlSchema.js'
import { shorten,
         getUrlsById,
         openShortUrl } from '../controllers/urlsController.js'



const urlsRoute = Router()

//urlsRoute.use(autenticationToken);

urlsRoute.post("/urls/shorten", autenticationToken, validateSchema(urlSchema), shorten)

urlsRoute.get("/urls/:id", getUrlsById)

urlsRoute.get("/urls/open/:shortUrl", openShortUrl)


export default urlsRoute