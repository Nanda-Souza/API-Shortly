import { db } from "../config/database.js";
import { nanoid } from 'nanoid'



export const shorten = (async (req, res) => {  

    try {
        const { authorization } = req.headers        

        const { url } = req.body;

        const token = authorization?.replace("Bearer ", '')

        const shortUrl = nanoid() //generates the nano ID     
            
        const userId = await db.query(`SELECT "userId" FROM sessions WHERE token = $1;`, [token]);        
    
        await db.query(
            `INSERT INTO urls (url, "shortUrl", "userId") VALUES ($1, $2, $3);`, [url, shortUrl, userId.rows[0].userId]);

        const result = await db.query(`SELECT id, "shortUrl" FROM urls WHERE "shortUrl" = $1 AND  "userId" = $2;`, [shortUrl, userId.rows[0].userId]);
  
      return res.status(201).send(result.rows[0])
  
  } catch (error) {
        res.status(500).send(error.message) 
  
  }
  })