let authSession = (req, res, next) => {

    if (req.session.userId && req.session.roleId==1) next();
    else{
        res.render("user/error-403");
    }
}


module.exports = {
    authSession: authSession
}