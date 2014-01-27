/*
  return home page
 */

exports.index = function(req, res){
    res.sendfile('views/home.html')
};