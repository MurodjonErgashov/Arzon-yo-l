const express = require("express");
const app = express()
const pool = require("../database/db")
const auth = require("../middleware/isDriver")
const flash = require("connect-flash")
app.use(flash())

// LOG OUT
app.use("/out", async (req, res) => {
    req.session.destroy()
    res.redirect('/login')
    // res.render("user/login",);
})

// 404  
app.get('/404', (req, res) => {
    res.render('user/error-500');
});


app.get('/main', (req, res) => {
    res.render('driver/main');
})

app.get('/index', (req, res) => {
    res.render('driver/index');
});

app.get('/routes', (req, res) => {
    pool.query(`
    SELECT * FROM magister_ay.regions;
    ;`, [], (err, rows, fields) => {

        if (err) return res.render("./user/error-500");
 console.log(rows)
        res.render('driver/cu_route', {data:rows, viloyat:[],tuman1:[],tuman2:[],mfy1:[],mfy2:[]})
    })
});

app.post('/addloan:id', (req, res) =>{
    console.log([req.params.id]);
    
    res.redirect('driver/routedet')
})

// ROUTE DETAILS
app.get('/routedet', (req, res) => {

    pool.query(`
    SELECT tr.*, concat(tp.first_name, ' ', tp.last_name) as full_name, cast(rn.rnk as decimal(5,2)) as rnk
    FROM magister_ay.tbl_routes tr
    join magister_ay.users us
    on us.id = tr.user_id
    join magister_ay.tbl_profile tp
    on tp.user_id = us.id
    join (select user_id, avg(rnk) rnk FROM magister_ay.user_status group by user_id) rn
    on rn.user_id = us.id; 
    SELECT * FROM magister_ay.regions;
    `, (err, rows, fields) => {

        if (err) return res.render("./user/error-500");
        const orders = rows[0] 
        const regions = rows[1]
        res.render('driver/routedet', {orders:orders,regions:regions})
    })
})

// CREATE ROUTE
app.post('/postroute', (req, res) => {
    console.log(req.body);
    // res.render('driver/table')
})

app.get('/getprofile/:id', (req, res) => {
    console.log(req.params);

    pool.query(`
    SELECT * FROM magister_ay.tbl_profile where user_id = ?
    `,[req.params.id], (err, rows, fields) => {

        if (err) return res.render("./user/error-500");
        const prof = rows[0] 
        console.log(prof);
        res.render('driver/profile', {prof:prof})
    })
})


// CONNECT PAYME/CLICK

// ACCEPT CLIENT TO ROUTE

// PUT COMMENT
app.get('/getstatus', (req, res)=>{
    res.render('driver/post_status')
})


app.post('/poststatus', (req, res)=>{
    const a = req.body;

    // console.log(req);
    console.log(a);
    return res.redirect('/driver/getstatus')
    pool.query("call sp_user_status(?,?,?,?,?) ; ", ['POST', a.rank, a.comment, /*user_id*/1, 0], (err, rows, fields) => {
        if (err) {
            return res.render("../user/error-500");
        }
        // console.log('Something: ' + rows[0][0].natija);
        // req.flash('sign-in', { msg: a.username+" muvaffaqiyatli ro'yhatdan o'tdingiz!" });
        
        return res.redirect('driver/post_status')
    })

})

// app.get("/comment", (req, res) => {
//     return res.render("comments");
// })



// CALCULATE DISTANCE/MONEY


// profileni o'zi
app.get("/profile", (req, res) => {
    let  mess = req.flash("driver_kirdi")
    // let role_id = mess[0].role_id
    // let user_id = mess[0].user_id
// console.log(mess[0]);
    return res.render("driver_profile", {mess: mess[0].msg});
})

app.get("/uppprofile", (req, res) => {
    
    pool.query(`
    SELECT * FROM magister_ay.driver_profile where user_id = ?;
    `,[1], (err, rows, fields) => {
        if (err) console.log(err); // return res.render("./user/error-500");
        // console.log(rows);
        const profile = {profile:rows} 
        console.log({...profile});
        res.render('driver_profile_edit', {...profile})
    })
    // return res.render("driver_profile_edit");
})

//profiledagi commentlarni ko'rish
app.get("/comments", (req, res) => {
    pool.query(`
    SELECT p.ismi, c.comment,
        case 
            when c.excellant=1 then 'Excellant'
            when c.verygood=1 then 'Very Good'
            when c.good=1 then 'Good'
            when c.bad=1 then 'Bad'
            else 'Awfull'
        end as status
    FROM magister_ay.comments c
    join magister_ay.driver_profile p
    where c.own_user_id = 1;

    select count(*) as counts,
        sum(excellant) as count_excell,
        sum(verygood) as count_vgood,
        sum(good) as count_good,
        sum(bad) as count_bad,
        sum(awfull) as count_awfull,
        cast((sum(excellant)*5+sum(verygood)*4+sum(good)*3+sum(bad)*2+sum(awfull)*1)/5 as decimal(15,1)) as avarg
    from magister_ay.comments
    `, (err, rows, fields) => {

        if (err) return res.render("./user/error-500");
        // console.log(rows);
        const comments = {comments:rows[0]} 
        const statistics = {statistics:rows[1]} 
        res.render('driver_comments_self', {...comments, ...statistics})
    })
})

app.get("/comm", (req, res) => {
    pool.query(`
    SELECT p.ismi, c.comment,
        case 
            when c.excellant=1 then 'Excellant'
            when c.verygood=1 then 'Very Good'
            when c.good=1 then 'Good'
            when c.bad=1 then 'Bad'
            else 'Awfull'
        end as status
    FROM magister_ay.comments c
    join magister_ay.driver_profile p
    where c.own_user_id = 1 limit 5;

    select count(*) as counts,
        sum(excellant) as count_excell,
        sum(verygood) as count_vgood,
        sum(good) as count_good,
        sum(bad) as count_bad,
        sum(awfull) as count_awfull,
        cast((sum(excellant)*5+sum(verygood)*4+sum(good)*3+sum(bad)*2+sum(awfull)*1)/5 as decimal(15,1)) as avarg
    from magister_ay.comments
    `, (err, rows, fields) => {

        if (err) return res.render("./user/error-500");
        // console.log(rows);
        const comments = {comments:rows[0]} 
        const statistics = {statistics:rows[1]} 
        res.render('driver_comments', {...comments, ...statistics})
    })
})

app.post("/addcomment", (req, res) => {
    console.log(req.body);
    const  {comment, rating1, rating2, rating3, rating4, rating5} = req.body
    console.log(rating5 == 'on' ? 1: 0);
    console.log(req.session.userId);
    a = req.session.userId
    user_id=1
    pool.query(`insert into magister_ay.comments(comment, excellant, verygood, good, bad, awfull, user_id, own_user_id)
    values(?,?,?,?,?,?,?,?)`, [comment, rating1 == 'on' ? 1: 0, rating2 == 'on' ? 1: 0, rating3 == 'on' ? 1: 0, rating4 == 'on' ? 1: 0, rating5 == 'on' ? 1: 0, user_id, user_id], (err, row, fields) => {
        if (err) //return res.render("./user/error-500");
            console.log(err);
        res.redirect("/driver/comm")     
    })
})

app.get("/news", (req, res) => {
    return res.render("driver_news");
})

app.get("/orders", (req, res) => {

    pool.query(`SELECT distinct vil.* FROM magister_ay.regions vil
    left join magister_ay.regions tum
    on tum.sub = vil.id
    where vil.sub < 16 and vil.sub > 1;
    
    SELECT u.username as ismi, ro.user_id, ro.number_people, ro.total_cost, fr.adres_name qayerdan,
        too.adres_name qayerga, dr.kun, concat(ro.number_people, 'x', dr.narxi, ' som') summa,
        dr.vaqt_from,  dr.vaqt_from as vaqt_to
        FROM magister_ay.order_route ro
        JOIN magister_ay.driver_route dr
        ON ro.route_id = dr.id
        JOIN magister_ay.regions fr
        ON fr.id = dr.qayerdan
        JOIN magister_ay.regions too
        ON too.id = dr.qayerga
        JOIN magister_ay.driver_profile p
        ON dr.user_id = p.user_id 
        JOIN magister_ay.users u
        ON u.id = ro.user_id
        where dr.kun < curdate() and dr.user_id = 1
        order by  dr.kun desc;
         
   SELECT u.username as ismi, ro.user_id, ro.number_people, ro.total_cost, fr.adres_name qayerdan,
        too.adres_name qayerga, dr.kun, concat(ro.number_people, 'x', dr.narxi, ' som') summa,
        dr.vaqt_from,  dr.vaqt_from as vaqt_to
        FROM magister_ay.order_route ro
        JOIN magister_ay.driver_route dr
        ON ro.route_id = dr.id
        JOIN magister_ay.regions fr
        ON fr.id = dr.qayerdan
        JOIN magister_ay.regions too
        ON too.id = dr.qayerga
        JOIN magister_ay.driver_profile p
        ON dr.user_id = p.user_id 
        JOIN magister_ay.users u
        ON u.id = ro.user_id
        where dr.kun >= curdate() and dr.user_id = 1
        order by  dr.kun desc;
    
    `, (err, rows, fields) => {
         if (err) console.log(err); //return res.render("./user/error-500");
        //console.log(row[0]);
        // console.log(req.session.userId);

        const address = {address:rows[0]}
        const routes = {routes:rows[1]}
        const routes1 = {routes1:rows[2]}

        // console.log("from_input: "+from_input)
        // console.log("to_input: "+to_input)
        res.render("driver_orders", {...address, ...routes, ...routes1})
    })
})

app.post("/updateprofile", (req, res) => {
    let {name, age, kasb, xobbi, phone, car, number, count, img } = req.body
    pool.query(`
    SELECT distinct vil.* FROM magister_ay.regions vil
    left join magister_ay.regions tum
    on tum.sub = vil.id
    where vil.sub < 16 and vil.sub > 1;
    `, (err, rows, fields) => {

        if (err) return res.render("./user/error-500");
        // console.log(rows);
        const locations = {locations:rows} 
        res.render('driver_profile_edit', {...locations})
    })
})

// route yaratish
app.get("/createroute", (req, res) => {
    pool.query(`
    SELECT distinct vil.* FROM magister_ay.regions vil
    left join magister_ay.regions tum
    on tum.sub = vil.id
    where vil.sub < 16 and vil.sub > 1;
    `, (err, rows, fields) => {

        if (err) return res.render("./user/error-500");
        // console.log(rows);
        const locations = {locations:rows} 
        res.render('driver_crudroute', {...locations})
    })
})

app.post("/createroute", (req, res) => {
    // console.log(req.body);
    const {qayerdan, qayerga, date1, quantity, type_car, has_smoke, has_pets, has_snake, has_loan, yuk_x, yuk_y, yuk_z, yuk_kg, narxi, count_yul} = req.body
    pool.query(`insert into magister_ay.driver_route(qayerdan, qayerga, kun, y_soni, m_turi, has_chekish, has_uy_hayvoni, has_snakes, yuk_bn, yuk_x, yuk_y, yuk_z, yuk_kg, narxi, vaqt_from, vaqt_to, user_id)
    values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)`, [qayerdan, qayerga, date1.substring(0,10), quantity, type_car, has_smoke=='on'?1:0, has_pets=='on'?1:0, has_snake=='on'?1:0, has_loan=='on'?1:0, yuk_x ==''?null:yuk_x, yuk_y==''?null:yuk_y, yuk_z==''?null:yuk_z, yuk_kg==''?null:yuk_kg, narxi,  date1.substring(11,16), (Number(date1.substring(11,13))+3) + date1.substring(13,16), req.session.userId], (err, row, fields) => {
        if (err) //return res.render("./user/error-500");
            console.log(err);
        res.redirect("/driver/allroute")
       
    })
})

// app.get("/mavjud_mashruts", (req, res) => {
//     console.log("mavjud_mashruts_account\n\n"+req.query)
//     let from = req.query.myDropdown1;
//     let to  = req.query.myDropdown2;

//     console.log(req.query);

//     pool.query(`SELECT distinct vil.* FROM magister_ay.regions vil
//     left join magister_ay.regions tum
//     on tum.sub = vil.id
//     where vil.sub < 16 and vil.sub > 1;
    
//     SELECT r.*, p.ismi, p.picture_url, p.chair_number, concat(p.mashina_rusumi,' ', mashina_raqam) type_car, concat(chair_number, 'x', r.narxi, ' som') summa,
//     r.has_chekish, r.has_uy_hayvoni, r.has_snakes, p.jinsi, re.adres_name as address_qayerdan, re2.adres_name as address_qayerga
//       FROM magister_ay.driver_route as r 
//     join magister_ay.driver_profile as p
//     on r.user_id = p.user_id 
// 	join magister_ay.regions re
//     on re.id = r.qayerdan
//     join  magister_ay.regions re2
//     on re2.id = r.qayerga
//     where r.qayerdan = ? and r.qayerga = ? and r.kun >= curdate() order by kun, vaqt_from desc;
    
//     `, [from, to], (err, rows, fields) => {
//          if (err) console.log(err); //return res.render("./user/error-500");
       
//         const address = {address:rows[0]}
//         const routes = {routes:rows[1]}
//         // console.log("from_input: "+from_input)
//         // console.log("to_input: "+to_input)
//         res.render("driver_allroute", {...address, ...routes})
//     })

// });

app.get("/allroute", (req, res) => {
    let from = req?.query?.myDropdown1;
    let to  = req?.query?.myDropdown2;
    console.log(from, to);
    pool.query(`SELECT distinct vil.* FROM magister_ay.regions vil
    left join magister_ay.regions tum
    on tum.sub = vil.id
    where vil.sub < 16 and vil.sub > 1;
    
    SELECT r.*, p.ismi, p.picture_url, p.chair_number, concat(p.mashina_rusumi,' ', mashina_raqam) type_car, concat(chair_number, 'x', r.narxi, ' som') summa,
    r.has_chekish, r.has_uy_hayvoni, r.has_snakes, p.jinsi, re.adres_name qayerdan_from, re2.adres_name qayerga_to
     FROM magister_ay.driver_route as r 
    join magister_ay.driver_profile as p
    on r.user_id = p.user_id
    left join regions re
    on re.id = r.qayerdan
    left join regions re2
    on re2.id = r.qayerga where r.user_id = ? and r.qayerdan = ? and r.qayerga = ? and r.kun >= curdate() order by r.kun desc`,[1, from?from:16, to?to:17], (err, rows, fields) => {
          if (err) return res.render("./user/error-500")
console.log(rows);
         const address = {address:rows[0]}
        const routes = {routes:rows[1]}
        res.render("driver_allroute", {...address, ...routes, from:from, to:to})
    })
})



module.exports = app;