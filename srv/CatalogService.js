const cds = require('@sap/cds');
module.exports = cds.service.impl(
    async function () { 

        const {
            EmployeeSet, POs
        } = this.entities;
    
        this.before('UPDATE', EmployeeSet, (req) => {
            console.log(req.data);
            if(req.data.Currency_code != 'USD'){
                req.error(500,"Please enter the salary in USD")
            }
            if(parseFloat(req.data.salaryAmount) >= 15000){
                req.error(500, "salary must be below 15k");
                
            }
        });
    
    
        //handling of sleep
       
        this.on('sleep', async () => {
            try {
                const db = await cds.connect.to('db');
                const dbClass = require('sap-hdbext-promisfied');
                let dbConn = new dbClass(await dbClass.createConnection(db.options.credentials));
                const hdbext = require('@sap/hdbext');
                const sp = await dbConn.loadProcedurePromisified(hdbext,null,'sleep');
                const output = await dbConn.callProcedurePromisified(sp,[]);
                console.log(output);
                return true;
            } catch (error) {
                console.log(error);
                return false;
            }
        });

        this.on('boost', async req =>{
            try{
                const ID = req.params[0];
                console.log("Your Purchase Order with ID " + ID + "will be boosted");
                const tx = cds.tx(req);
                await tx.update(POs).with({
                    GROSS_AMOUNT: { '+=' : 20000 }, NOTE: "Boosted!!"
                }).where(ID);
                return {};  
            }
            catch (error) {
                return "Error " + error.toString();
            }
        });

        this.on('largestOrder', async req => {
            try {
                
                console.log("In Largest Order Function");
                const tx = cds.tx(req);
                const reply = await tx.read(POs).orderBy({
                    GROSS_AMOUNT: 'desc'
                }).limit(1);
                return reply;
    
            } catch (error) {
                return "Error " + error.toString();
            }
        });

    }
);    