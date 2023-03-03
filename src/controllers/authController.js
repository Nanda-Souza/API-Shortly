import { db } from "../config/database.js";
import bcrypt from "bcrypt"
import { v4 as uuidV4 } from "uuid";

export const signin = (async (req, res) => {  

  try {

    const { email, password } = req.body;
    
    const checkUser = await db.query(`SELECT * FROM users WHERE EMAIL = $1;`, [email]);    

    if (checkUser.rowCount  === 0) return res.status(401).send("Invalid User or Password!")

    const validatePass = bcrypt.compareSync(password, checkUser.rows[0].password)

    if (!validatePass) return res.status(401).send("Invalid User or Password!")

    const token = uuidV4()

      await db.query(
      `INSERT INTO sessions (token, "userId") VALUES ($1, $2);`, [token, checkUser.rows[0].id]);

    return res.status(200).send({ token })

} catch (error) {
    res.status(500).send(error.message)    

}
})

export async function signup(req, res) {
  
  try {
    const { name, email, password } = req.body
    const hashPass = bcrypt.hashSync(password, 10)

    const result = await db.query(`SELECT * FROM users WHERE EMAIL = $1;`, [email]);

    
    if(result.rowCount > 0)
      return res.status(409).send("User already exists!")

      await db.query(
        `INSERT INTO users (name, email, password) VALUES ($1, $2, $3);`, [name, email, hashPass]);
    
    res.status(201).send("User Registered!")

  } catch (error) {
    res.status(500).send(error.message)
  }
}

