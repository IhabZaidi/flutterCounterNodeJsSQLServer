var Db  = require('./dboperations');
var Users = require('./users');
const dboperations = require('./dboperations');
var express = require('express');
var bodyParser = require('body-parser');
var cors = require('cors');
var app = express();
var router = express.Router();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());
app.use('/api', router);
router.use((request,response,next)=>{
   console.log('middleware');
   next();
})
router.route('/counter').get((request,response)=>{

   dboperations.getValue().then(result => {
      response.json(result[0]);
   })
})
router.route('/counter/:amount').get((request,response)=>{

   dboperations.editValue(request.params.amount).then(result => {
      response.json(result[0]);
   })
})

var port = process.env.PORT || 8090;
app.listen(port);
console.log('Users API is runnning at ' + port);
