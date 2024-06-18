const express = require("express");
const app = express();
const connection = require("../database/db");
const auth = require("../middleware/isDriver")
const pool = require("../database/db")
const flash = require("connect-flash")
app.use(flash())

app.get('/index', (req, res) => {
    res.render('client/index');
});

app.get("/profile", (req, res) => {
    return res.render("client_profile");
})

//haydovchiga comment qo'yish
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
        res.render('client_comments_self', {...comments, ...statistics})
    })
    // return res.render("client_comments");
})

app.get("/comm", (req, res) => {
 console.log(req.body);

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
        res.render('client_comments', {...comments, ...statistics})
    })
    // return res.render("client_comments");
})

app.post("/filter_sidebar", (req, res) => {

    console.log(req.body)

    let query1 =   `SELECT r.*, p.ismi, p.picture_url, p.chair_number, concat(p.mashina_rusumi,' ', mashina_raqam) type_car, concat(chair_number, 'x', r.narxi, ' som') summa,
    r.has_chekish, r.has_uy_hayvoni, r.has_snakes, p.jinsi
     FROM magister_ay.driver_route as r 
    join magister_ay.driver_profile as p
    on r.user_id = p.user_id where 1=1 `
    
    for (let prop in req.body){
        switch(prop){
            case 'ichimlikbn': query1 += "and r.has_snakes=1 "; break;
            case 'hayvonbn': query1 += "and r.has_uy_hayvoni=1 "; break;
            case 'chekishbn': query1 += "and r.has_chekish=1 "; break;
            case 'yukbn': query1 += "and r.yuk_bn = 1 "; break;
            case 'faqaterkak': query1 += "and p.jinsi = 1 "; break;
            case 'faqatayol': query1 += "and p.jinsi=0 "; break;
            case 'time1': query1 += "and r.vaqt_from > '12:00' "; break;
            case 'time2': query1 += "and r.vaqt_from > '18:00' "; break;
            case 'time3': query1 += "and r.vaqt_from < '18:00' "; break;
            case 'engarzon': query1 += "and r.narxi <=150 "; break;
            default: 'and 1=1'
        }
    }
    pool.query(`
     ${query1};
    SELECT distinct vil.* FROM magister_ay.regions vil
    left join magister_ay.regions tum
    on tum.sub = vil.id
    where vil.sub < 16 and vil.sub > 1;
    
    
    SELECT distinct vil.adres_name FROM magister_ay.regions vil
    left join magister_ay.regions tum
    on tum.sub = vil.id
    where vil.sub < 16 and vil.sub > 1 and vil.id = ${req.body.from};

    SELECT distinct vil.adres_name FROM magister_ay.regions vil
    left join magister_ay.regions tum
    on tum.sub = vil.id
    where vil.sub < 16 and vil.sub > 1 and vil.id = ${req.body.to};

    `, (err, rows, fields) => {
        if (err) console.log(err);//return res.render("user/404");
        const address={address:rows[1]}
        const routes = {routes: rows[0]}

        const from_input = rows[2][0].adres_name
        const to_input = rows[3][0].adres_name
        res.render('client_mavjud_mashruts', {...address, ...routes,from:req.body.from,to:req.body.to,from_input:from_input,to_input:to_input, date1: req.body.date1, quantity: req.body.quantity})
    })
})



app.post("/filter_sidebar_account", (req, res) => {

    console.log(req.body)

    let query1 =   `SELECT r.*, p.ismi, p.picture_url, p.chair_number, concat(p.mashina_rusumi,' ', mashina_raqam) type_car, concat(chair_number, 'x', r.narxi, ' som') summa,
    r.has_chekish, r.has_uy_hayvoni, r.has_snakes, p.jinsi
     FROM magister_ay.driver_route as r 
    join magister_ay.driver_profile as p
    on r.user_id = p.user_id where 1=1 `
    
    for (let prop in req.body){
        switch(prop){
            case 'ichimlikbn': query1 += "and r.has_snakes=1 "; break;
            case 'hayvonbn': query1 += "and r.has_uy_hayvoni=1 "; break;
            case 'chekishbn': query1 += "and r.has_chekish=1 "; break;
            case 'yukbn': query1 += "and r.yuk_bn = 1 "; break;
            case 'faqaterkak': query1 += "and p.jinsi = 1 "; break;
            case 'faqatayol': query1 += "and p.jinsi=0 "; break;
            case 'time1': query1 += "and r.vaqt_from > '12:00' "; break;
            case 'time2': query1 += "and r.vaqt_from > '18:00' "; break;
            case 'time3': query1 += "and r.vaqt_from < '18:00' "; break;
            case 'engarzon': query1 += "and r.narxi <=150 "; break;
            default: 'and 1=1'
        }
    }
    pool.query(`
     ${query1};
    SELECT distinct vil.* FROM magister_ay.regions vil
    left join magister_ay.regions tum
    on tum.sub = vil.id
    where vil.sub < 16 and vil.sub > 1;
    
    
    SELECT distinct vil.adres_name FROM magister_ay.regions vil
    left join magister_ay.regions tum
    on tum.sub = vil.id
    where vil.sub < 16 and vil.sub > 1 and vil.id = ${req.body.from};

    SELECT distinct vil.adres_name FROM magister_ay.regions vil
    left join magister_ay.regions tum
    on tum.sub = vil.id
    where vil.sub < 16 and vil.sub > 1 and vil.id = ${req.body.to};

    `, (err, rows, fields) => {
        if (err) console.log(err);//return res.render("user/404");
        const address={address:rows[1]}
        const routes = {routes: rows[0]}

        const from_input = rows[2][0].adres_name
        const to_input = rows[3][0].adres_name
        res.render('client_filter_road2', {...address, ...routes,from:req.body.from,to:req.body.to,from_input:from_input,to_input:to_input, date1: req.body.date1, quantity: req.body.quantity})
    })
})

// mashrutni filter orqali topish
app.get("/allroute", (req, res) => {
    
    pool.query(`
    SELECT r.*, p.ismi, p.picture_url, p.chair_number, concat(p.mashina_rusumi,' ', mashina_raqam) type_car, concat(chair_number, 'x', r.narxi, ' som') summa,
    r.has_chekish, r.has_uy_hayvoni, r.has_snakes, p.jinsi, re.adres_name as address_qayerdan, re2.adres_name as address_qayerga
      FROM magister_ay.driver_route as r 
    join magister_ay.driver_profile as p
    on r.user_id = p.user_id 
	join magister_ay.regions re
    on re.id = r.qayerdan
    join  magister_ay.regions re2
    on re2.id = r.qayerga
    where r.kun >= curdate();


    SELECT distinct vil.* FROM magister_ay.regions vil
    left join magister_ay.regions tum
    on tum.sub = vil.id
    where vil.sub < 16 and vil.sub > 1;`, (err, rows, fields) => {
        if (err) return res.render("user/404");
        const address={address:rows[1]}
        const routes = {routes: rows[0]}
        //console.log(req);
        res.render('client_filter_road2', {...address, ...routes})
    })
})

app.get("/news", (req, res) => {
    return res.render("client_news");
})

app.get("/orders", (req, res) => {

    pool.query(`SELECT distinct vil.* FROM magister_ay.regions vil
    left join magister_ay.regions tum
    on tum.sub = vil.id
    where vil.sub < 16 and vil.sub > 1;
    
    SELECT p.ismi, ro.user_id, ro.number_people, ro.total_cost, fr.adres_name qayerdan,
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
        where dr.kun < curdate()
        order by  dr.kun desc;
         
    SELECT p.ismi, ro.user_id, ro.number_people, ro.total_cost, fr.adres_name qayerdan,
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
        where dr.kun >= curdate()
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
        res.render("client_orders", {...address, ...routes, ...routes1})
    })
})

app.post("/goorderdetails", (req, res) => {
    const {number_people, narxi, route_id} = req.body
    res.redirect(`/client/orderdetail/${route_id}?c=${number_people}&n=${narxi}`)
})


app.get("/orderdetail/:route_id", (req, res) => {
    const route_id = req.params.route_id;
    const {c, n} = req.query
    pool.query(`
    SELECT r.*, p.ismi, p.picture_url, p.chair_number, concat(p.mashina_rusumi,' ', mashina_raqam) type_car, concat(chair_number, 'x', r.narxi, ' som') summa,
    r.has_chekish, r.has_uy_hayvoni, r.has_snakes, p.jinsi, re.adres_name as address_qayerdan, re2.adres_name as address_qayerga
      FROM magister_ay.driver_route as r 
    join magister_ay.driver_profile as p
    on r.user_id = p.user_id 
	join magister_ay.regions re
    on re.id = r.qayerdan
    join  magister_ay.regions re2
    on re2.id = r.qayerga where r.id = ? order by kun desc`,[route_id], (err, rows, fields) => {
         if (err) console.log(err); //return res.render("./user/error-500");
        const routes = {routes:rows}
        console.log(routes);
        res.render("client_order_detail", {...routes, number_people: c, narxi:n, route_id:route_id})
    })
})

app.post("/orderroute", (req, res) => {
    console.log(req.body)
    let  {number_people,route_id, narxi} = req.body
    if(number_people == 'undefined'){
        number_people=1
    }
    console.log(number_people);
    console.log(req.session.userId||1);
    pool.query(`insert into magister_ay.order_route(route_id, number_people, total_cost, user_id)
    values(?,?,?,?)`, [route_id,number_people,Number(narxi)*Number(number_people), req.session.userId||2], (err, row, fields) => {
        if (err) return res.render("./user/error-500");
        res.redirect("/client/orders")     
    })  
})



// CREATE ROUTE

// CONNECT PAYME/

// ACCEPT CLIENT TO ROUTE

// PUT COMMENT

module.exports = app;