var config = require('./dbconfig');
const sql = require('mssql');
const users = require('./users');
async function getValue() {
    try {
        let pool = await sql.connect(config);
        let value = await pool.request().query("DECLARE @retVal int SELECT @retVal = COUNT(*) FROM counter_table IF (@retVal = 0) BEGIN insert into counter_table values (1, 0) END ELSE BEGIN SELECT countervalue from counter_table where ID = 1 END;");
        return value.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}
async function editValue(amount) {
    try {
        let pool = await sql.connect(config);
        let value = await pool.request()
        .input('input_parameter', sql.Int, amount)
        .query("DECLARE @retVal int SELECT @retVal = COUNT(*) FROM counter_table IF (@retVal = 0) BEGIN insert into counter_table values (1, 0) END ELSE BEGIN UPDATE counter_table SET countervalue = countervalue + @input_parameter WHERE ID = 1 END;");
        return value.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}
module.exports = {
    getValue: getValue,
    editValue: editValue
}