const mongoose=require("mongoose");
const plm=require("passport-local-mongoose");

mongoose.connect("mongodb+srv://amol230703:UEDmNSeofMiSTXty@cluster0.2nk2u.mongodb.net/");
console.log("the database connection succesfully done");

const userSchema=mongoose.Schema({
  username:String,
  name:String,
  email:String,
  password:String,
  profileImage:String,
  bio:String,
  requests: [
    {
      from: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true,
      },
      message: {
        type: String,
        required: true,
      },
      status: {
        type: String,
        enum: ['pending', 'accepted', 'rejected'],
        default: 'pending',
      },
    },
  ],
  posts:[{type:mongoose.Schema.Types.ObjectId,ref:"post"}],
  followers:[{type:mongoose.Schema.Types.ObjectId,ref:"user"}],
  following:[{type:mongoose.Schema.Types.ObjectId,ref:"user"}],
})

userSchema.plugin(plm);
const User = mongoose.model("user",userSchema);

module.exports = User;