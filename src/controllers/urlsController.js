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

  export const getUrlsById = (async (req, res) => {

    try {
        const { id } = req.params;        
        
        if(!parseInt(id))
            return res.status(404).send("Url not found!");
        
        const result = await db.query( `SELECT id, url, "shortUrl" FROM urls WHERE id = $1;`, [id]);
                 
        if (result.rowCount === 0){
          return res.status(404).send("Url not found!");
            
        }
        res.status(200).send(result.rows[0]);

        } catch (err) {
          res.status(500).send(err.message);
        }
      
      })


      export const openShortUrl = (async (req, res) => {

        try {
            const { shortUrl } = req.params;        
            
            const result = await db.query( `SELECT * FROM urls WHERE "shortUrl" = $1;`, [shortUrl]);        
          
            if (result.rowCount === 0){
              return res.status(404).send("ShortUrl not found!");
                
            }

            await db.query( `UPDATE urls SET "visitCount" = "visitCount" + 1 WHERE "shortUrl" = $1;`, [shortUrl]);            
            
            res.status(200).redirect(result.rows[0].url);
    
            } catch (err) {
              res.status(500).send(err.message);
            }
          
          })