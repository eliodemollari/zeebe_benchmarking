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
    const deploy_process = await zbc.deployProcess('bench.bpmn')
    console.log(deploy_process)

    // Starting nine instances of that process
    for (let i = 1; i < 10; i++){
        console.log('Start instance no. ', i)
        const start_instance = await zbc.createProcessInstance('benchmark', {
            testData: 'something',
        })
        console.log(start_instance)
    }
})()
