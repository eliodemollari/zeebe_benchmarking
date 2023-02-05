const ZB = require('zeebe-node')

// Broker
void (async () => {
    const zbc = new ZB.ZBClient('localhost:26500')
    const topology = await zbc.topology()
    console.log(JSON.stringify(topology, null, 2))
})()

// Process deploy and start instance
void (async () => {
    const zbc = new ZB.ZBClient() // localhost:26500 || ZEEBE_GATEWAY_ADDRESS

    // Deploy a bpmn process
    const deploy_process = await zbc.deployProcess('./processes/online_ticket_purchase.bpmn')
    console.log(deploy_process)

    // Starting nine instances of online_ticket_purchase.bpmn
    while (true){
        console.log('Deploying instances. ')
        const start_instance = await zbc.createProcessInstance('Process_1mqc2bt', {
            testData: 'something',
        })
        console.log(start_instance)
    }
})()