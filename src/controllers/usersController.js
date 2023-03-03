import { db } from "../config/database.js";

export const getUserInfo = (async (req, res) => {

    try {
        const { authorization } = req.headers          

        const token = authorization?.replace("Bearer ", '')
    
        const userId = await db.query(`SELECT "userId" FROM sessions WHERE token = $1;`, [token]);                
    
        const result = await db.query( 
            `SELECT us.id, us.name,
            SUM(ur."visitCount") as "visitCount",
            json_agg(JSON_BUILD_OBJECT('id', ur.id, 'shortUrl', ur."shortUrl", 'url', ur.url, 'visitCount', ur."visitCount")) AS "shortenedUrls"
            FROM users us
            JOIN urls ur ON ur."userId" = us.id
            WHERE us.id = $1
            GROUP BY us.id;`, [userId.rows[0].userId]);
        
        res.status(200).send(result.rows[0]);

        } catch (err) {
        res.status(500).send(err.message);
        }
    
    })