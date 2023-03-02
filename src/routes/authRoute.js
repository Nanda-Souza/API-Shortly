import { Router } from "express";
import { validateSchema } from "../middlewares/validateSchema.js";
import { authSchema,
         loginSchema } from '../schemas/authSchema.js'
import { signup,
         signin } from '../controllers/authController.js'



const authRoute = Router()

authRoute.post("/signup", validateSchema(authSchema), signup)

authRoute.post("/signin", validateSchema(loginSchema), signin)

export default authRoute