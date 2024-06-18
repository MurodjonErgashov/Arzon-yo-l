const cookieParser = require("cookie-parser");
const express = require("express");
const session = require("express-session");
const app = express();
const path = require("path")
const flash = require('connect-flash');


// session
app.use(cookieParser("ed@MVSMBMV1q34#$4jhjvc1"));
app.use(session({
    secret: "ed@MVSMBMV1q34#$4jhjvc1",
    resave: false,
    saveUninitialized: false,
    // store: new FileStore({ path: 'session-store' }),
    cookie: { maxAge: 3600000, 
              secure: false, 
              httpOnly: false 
            }
}))

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(__dirname + '/public'));
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(flash())
// FILE UPLOAD
app.use("/", require("./app/app"));

const PORT = process.env.PORT || 8081;
app.listen(PORT, () => {
    console.log(`Server UP and Running in ${PORT}`);
})