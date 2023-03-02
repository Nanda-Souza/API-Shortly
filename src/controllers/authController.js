import { db } from "../config/database.js";
import bcrypt from "bcrypt"
import { v4 as uuidV4 } from "uuid";

/*export const login = (async (req, res) => {
  const { email, senha } = req.body;

  try {
    const usuarioOn = await db.collection("usuarios").findOne({ email })

    if (!usuarioOn) return res.status(400).send("Usuário ou senha incorretos")

    const verificaSenha = bcrypt.compareSync(senha, usuarioOn.senha)

    if (!verificaSenha) return res.status(400).send("Usuário ou senha incorretos")

    const token = uuidV4()

    await db.collection("sessoes").insertOne({ idUsuario: usuarioOn._id, token })

    return res.status(200).send({ token })

} catch (error) {
    res.sendStatus(500)
    console.log(error)

}
})*/

export async function signup(req, res) {
  
  try {
    const { name, email, password } = req.body
    const hashPass = bcrypt.hashSync(password, 10)

    const result = await db.query(`SELECT * FROM users WHERE EMAIL = $1`, [email]);

    
    if(result.rows.length > 0)
      return res.status(409).send("User already exists!")

      await db.query(
        `INSERT INTO users (name, email, password) VALUES ($1, $2, $3)`, [name, email, hashPass]);
    
    res.status(201).send("User Registered!")

  } catch (error) {
    res.status(500).send(error.message)
  }
}

