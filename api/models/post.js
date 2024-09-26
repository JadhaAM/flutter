const mongoose=require("mongoose");

const postSchema=mongoose.Schema({
  
  picture:String,
  user:{
    type:mongoose.Schema.Types.ObjectId,
    ref:"user"
   
  },
  caption:String,
  data:{
    type:Date,
    default:Date.now,
   
  },
   like:[{
    type:mongoose.Schema.Types.ObjectId,
    ref:"user"
   
  }],
  comments:[{
    comment:{type:String},
    postedBy:{type:mongoose.Schema.Types.ObjectId,
      ref:"user"}
  }],
  posts:[{type:mongoose.Schema.Types.ObjectId,ref:"post"}],
});

module.exports=mongoose.model("post",postSchema);
