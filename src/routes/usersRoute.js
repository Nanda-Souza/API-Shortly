import { Router } from "express";
import { autenticationToken } from "../middlewares/validateTolken.js";
import { getUserInfo,
         getRanking } from '../controllers/usersController.js'


const usersRoute = Router()

usersRoute.get("/users/me", autenticationToken, getUserInfo)

usersRoute.get("/ranking", getRanking)

export default usersRoute