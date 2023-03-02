import { Router } from "express";
import { validateSchema } from "../middlewares/validateSchema.js";
import { authSchema } from '../schemas/authSchema.js'
import { signup } from '../controllers/authController.js'



const authRoute = Router()

authRoute.post("/signup", validateSchema(authSchema), signup)

export default authRoute