const ZB = require('zeebe-node')
const fs = require("fs");

// Broker
void (async () => {
    const zbc = new ZB.ZBClient('EXTERNAL_IP_ADD_ZEEBE_CLUSTER:26500\'')
    const topology = await zbc.topology()
    console.log(JSON.stringify(topology, null, 2))
})()

// Process deploy and start instance
void (async () => {
    const zbc = new ZB.ZBClient('EXTERNAL_IP_ADD_ZEEBE_CLUSTER:26500')

    // Deploy a bpmn process
    const deploy_process = await zbc.deployProcess('../processes/online_ticket_purchase.bpmn')
    console.log(deploy_process)

    // Starting nine instances of online_ticket_purchase.bpmn
    while (true){
        console.log('Deploying instances. ')
        const start_instance = await zbc.createProcessInstance('Process_1mqc2bt', {
            testData: 'something',
        })
        fs.appendFile("result.txt", JSON.stringify(start_instance), (err) => {
            if (err) {
                console.log(err);
            }
            else {
                // Get the file contents after the append operation
                console.log(start_instance);
            }
        });
    }
})()
