const config = {
    user :'Ihab',
    password :'2021',
    server:'127.0.0.1',
    database:'fluttercounter',
    options:{
        trustedconnection: true,
        enableArithAbort : true, 
        trustServerCertificate: true,
        instancename :'Instance Name'
    },
    port : 1433
}

module.exports = config; 