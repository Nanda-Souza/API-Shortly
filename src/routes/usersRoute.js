import { Router } from "express";
import { autenticationToken } from "../middlewares/validateTolken.js";
import { getUserInfo } from '../controllers/usersController.js'



const usersRoute = Router()

usersRoute.get("/users/me", autenticationToken, getUserInfo)

export default usersRoute