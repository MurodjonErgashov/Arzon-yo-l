const express = require("express");
const app = express()
const pool = require("../database/db")
const flash = require("connect-flash")
const request = require("request");
app.use(flash());

//SIGN UP [GET]
app.get("/signup", (req, res) => {
    return res.render("login-register");
})

//SIGN IN [GET]
app.get("/signin", (req, res) => {
    // const userName = req.flash('sign-in');
    return res.render("login-register"/*, {...userName[0]}*/);
})

//SIGN UP [POST]
app.post("/signup",  async (req, res) => {
    const a = req.body;
    console.log(a);
    pool.query("call user_edit_insert(?,?,?,?) ; ", [a.username, a.phone, a.role, a.password], (err, rows, fields) => {
        if (err) {
            return res.render("user/error-500");
        }
        console.log(rows);
        return res.redirect('/signin')
    })
})


//SIGN IN [POST]
app.post("/signin",  async (req, res) => {
    const a = req.body;
    console.log(a);
    pool.query("call login_check(?,?) ;", [ a.phone,  a.password], (err, rows, fields) => {
        if (err) {
            return res.render("user/error-500");
        }
        // console.log(rows);
        if(rows[0][0].natija*1==0) return res.render("login-register",{msg:"Bunday foydalanuvchi mavjud emas!"});
        
        else if(rows[0][0].role_id*1>0){
            req.session.userId = rows[0][0].natija*1;
            req.session.roleId = rows[0][0].role_id;
            req.session.roleName = rows[0][0].role_name;
            // DRIVER PART
            if(rows[0][0].role_id*1==1){
                req.flash('driver_kirdi', {msg:(rows[0][0].role_name == 'ROLE_DRIVER'? 'Haydovchi': "Client")+": Murodjon Ergashov"});
                return res.redirect('/driver/uppprofile')
            }
            // CLIENT PART
            else if(rows[0][0].role_id*1==2){
                req.flash('client_kirdi', {msg:(rows[0][0].role_name == 'ROLE_DRIVER'? 'Haydovchi': "Client") +": Shaxzod Hamroyev", role_id: rows[0][0].role_id, user_id:  rows[0][0].natija*1});
                return res.redirect('/client/profile')
            }
            else{
                return res.render("user/error-500");
            }
        }

    })
})







app.get("/", (req, res) => { 
    pool.query(`SELECT distinct vil.* FROM magister_ay.regions vil
    left join magister_ay.regions tum
    on tum.sub = vil.id
    where vil.sub < 16 and vil.sub > 1;

    SELECT r.*, p.ismi, p.picture_url, p.chair_number, concat(p.mashina_rusumi,' ', mashina_raqam) type_car, concat(chair_number, 'x', r.narxi, ' som') summa,
    r.has_chekish, r.has_uy_hayvoni, r.has_snakes, p.jinsi, re.adres_name as address_qayerdan, re2.adres_name as address_qayerga
      FROM magister_ay.driver_route as r 
    join magister_ay.driver_profile as p
    on r.user_id = p.user_id 
    join magister_ay.regions re
    on re.id = r.qayerdan
    join  magister_ay.regions re2
    on re2.id = r.qayerga
    where kun >= curdate()
    order by kun, vaqt_from desc;

    `, (err, rows, fields) => {
        if (err) return res.render("user/404");
        const address={address:rows[0]}
        const routes={routes:rows[1]}
        //console.log({...routes});
        res.render('index', {...address, ...routes})
    })
})

app.get("/mavjud_mashruts", (req, res) => {
    console.log("mavjud_mashruts\n\n"+req.query)
    let from = req.query.myDropdown1;
    let to  = req.query.myDropdown2;
    let date1 = req.query.date1;
    let quantity = req.query.quantity;

    pool.query(`SELECT distinct vil.* FROM magister_ay.regions vil
    left join magister_ay.regions tum
    on tum.sub = vil.id
    where vil.sub < 16 and vil.sub > 1;
    
    SELECT r.*, p.ismi, p.picture_url, p.chair_number, concat(p.mashina_rusumi,' ', mashina_raqam) type_car, concat(chair_number, 'x', r.narxi, ' som') summa,
    r.has_chekish, r.has_uy_hayvoni, r.has_snakes, p.jinsi, re.adres_name as address_qayerdan, re2.adres_name as address_qayerga
      FROM magister_ay.driver_route as r 
    join magister_ay.driver_profile as p
    on r.user_id = p.user_id 
	join magister_ay.regions re
    on re.id = r.qayerdan
    join  magister_ay.regions re2
    on re2.id = r.qayerga
    where r.qayerdan = ? and r.qayerga = ? and r.kun >= curdate() order by kun, vaqt_from desc;
    
    
    SELECT distinct vil.adres_name FROM magister_ay.regions vil
    left join magister_ay.regions tum
    on tum.sub = vil.id
    where vil.sub < 16 and vil.sub > 1 and vil.id = ${from};

    SELECT distinct vil.adres_name FROM magister_ay.regions vil
    left join magister_ay.regions tum
    on tum.sub = vil.id
    where vil.sub < 16 and vil.sub > 1 and vil.id = ${to};
    `, [from, to], (err, rows, fields) => {
         if (err) console.log(err); //return res.render("./user/error-500");
        //console.log(row[0]);
        // console.log(req.session.userId);

        const address = {address:rows[0]}
        const routes = {routes:rows[1]}
        const from_input = rows[2][0].adres_name
        const to_input = rows[3][0].adres_name

        // console.log("from_input: "+from_input)
        // console.log("to_input: "+to_input)
        res.render("client_mavjud_mashruts", {...address, ...routes, from: from, to: to, date1: date1, quantity: quantity,from_input:from_input,to_input:to_input})
    })


   
})



app.get("/mavjud_mashruts_account", (req, res) => {
    console.log("mavjud_mashruts_account\n\n"+req.query)
    let from = req.query.myDropdown1;
    let to  = req.query.myDropdown2;
    let date1 = req.query.date1;
    let quantity = req.query.quantity;

    pool.query(`SELECT distinct vil.* FROM magister_ay.regions vil
    left join magister_ay.regions tum
    on tum.sub = vil.id
    where vil.sub < 16 and vil.sub > 1;
    
    SELECT r.*, p.ismi, p.picture_url, p.chair_number, concat(p.mashina_rusumi,' ', mashina_raqam) type_car, concat(chair_number, 'x', r.narxi, ' som') summa,
    r.has_chekish, r.has_uy_hayvoni, r.has_snakes, p.jinsi, re.adres_name as address_qayerdan, re2.adres_name as address_qayerga
      FROM magister_ay.driver_route as r 
    join magister_ay.driver_profile as p
    on r.user_id = p.user_id 
	join magister_ay.regions re
    on re.id = r.qayerdan
    join  magister_ay.regions re2
    on re2.id = r.qayerga
    where r.qayerdan = ? and r.qayerga = ? and r.kun >= curdate() order by kun, vaqt_from desc;
    
    
    SELECT distinct vil.adres_name FROM magister_ay.regions vil
    left join magister_ay.regions tum
    on tum.sub = vil.id
    where vil.sub < 16 and vil.sub > 1 and vil.id = ${from};

    SELECT distinct vil.adres_name FROM magister_ay.regions vil
    left join magister_ay.regions tum
    on tum.sub = vil.id
    where vil.sub < 16 and vil.sub > 1 and vil.id = ${to};
    `, [from, to], (err, rows, fields) => {
         if (err) console.log(err); //return res.render("./user/error-500");
        //console.log(row[0]);
        // console.log(req.session.userId);

        const address = {address:rows[0]}
        const routes = {routes:rows[1]}
        const from_input = rows[2][0].adres_name
        const to_input = rows[3][0].adres_name

        // console.log("from_input: "+from_input)
        // console.log("to_input: "+to_input)
        res.render("client_filter_road2", {...address, ...routes, from: from, to: to, date1: date1, quantity: quantity,from_input:from_input,to_input:to_input})
    })


   
})








app.get("/profile_edit", (req, res) => {
    return res.render("profile-edit");
})



module.exports = app