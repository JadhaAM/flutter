const express = require('express');
const dotenv = require('dotenv');
const userModel = require('./models/users');
const postModel = require('./models/post'); 
const bodyParser = require('body-parser');
const path =require('path');
const crypto = require('crypto');
const cors = require('cors');
const upload=require("./models/multer"); 
const Secret = require('./models/Secret');
const authenticateToken =require("./models/authenticateToken");
const port = process.env.PORT || 5001;

const app = express();

dotenv.config({ path: path.join(__dirname, './.env.example') });

app.use(cors());

app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

const jwt = require('jsonwebtoken');

app.use('/users', userModel);

app.get('/profile', authenticateToken, async (req, res) => {
  console.log('Inside /profile endpoint');
  try {
    const userId = req.user.userId;
    console.log('User ID from token:', userId);

    const user = await userModel.findById(userId);
    if (!user) {
      console.log('User not found');
      return res.status(404).json({ message: 'User not found' });
    }
    console.log('User found:', user);
    res.json(user);
  } catch (error) {
    console.error('Error fetching user from server:', error);
    res.status(500).json({ message: 'Error fetching user' });
  }
});

app.get('/username/:username', async function(req, res) {
  try {
    const usernameParam = req.params.username;
    
    if (!usernameParam || typeof usernameParam !== 'string') {
      return res.status(400).json({ error: 'Invalid username parameter' });
    }

   
    const rege = new RegExp(`^${usernameParam}.*`, 'i');
    
    
    const users = await userModel.find({ username: rege });

    
    res.json(users);
  } catch (error) {
    console.error('Error fetching users:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.get("/username/:id",(req,res)=>{
  userModel.findOne({_id:req.body.id})
  .select("-password")
  .then(user=>{
    postModel.find({posts:req.body.id})
    .populate("posts","_id")
    .exec((err,post)=>{
      if(err){
        return res.status(422).json({error:err})
      }
      res.status(200).json({user,post})
    })
  }).catch(err=>{
    return res.status(404).json({error:"user not found"})
  })
})

app.post("/register" ,async function(req,res,next){
 console.log("am here");
 try{   
 const {username,name, email, password } = req.body;

 const newUser = new userModel({ username, name, email, password });
 await newUser.save();
 console.log("User registered successfully");
 res.status(200).json({ message: 'User registered successfully!' });
} catch (error) {
  console.error('Error creating a user:', error); 
  res.status(500).json({ message: 'Error registering the user' });
}
});

app.post("/login", async (req, res) => {
  try {
    const { username, password } = req.body;

    const user = await userModel.findOne({ username });
    if (!user) {
      return res.status(401).json({ message: 'Invalid username' });
    }

    if (user.password !== password) {
      return res.status(401).json({ message: 'Invalid password' });
    }

    var secretKey = crypto.randomBytes(32).toString('hex');

    
    await Secret.create({ userId: user._id, secret: secretKey });

    const token = jwt.sign({ userId: user._id }, secretKey);
    console.log("token:", token);
    res.status(200).json({ token });
  } catch (error) {
    console.log('error logging in', error);
    res.status(500).json({ message: 'Error logging In' });
  }
});

app.listen(port,()=>{
 console.log(`the server start in ${port}` );
});

