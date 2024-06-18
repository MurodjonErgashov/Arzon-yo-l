let authSession = (req, res, next) => {

    
    if (req.session.userId && req.session.roleId==2) next();
    else{
        res.render("user/error-403");
    }
}


module.exports = {
    authSession: authSession
}