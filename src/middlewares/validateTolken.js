import { db } from "../config/database.js";

export async function autenticationToken(req, res, next) {
  
  const { authorization } = req.headers

  const token = authorization?.replace("Bearer ", '')

  if (!token) 
    return res.status(401).send("Inform token!")

  try {

    const checkSession = await db.query(`SELECT "userId" FROM sessions WHERE token = $1;`, [token]);    

    if (checkSession.rowCount  === 0) 
        return res.status(422).send("Unauthorized Access!")    

    next()

  } catch (error) {
        res.status(500).send(error)
  }
}