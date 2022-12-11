![postmortem](https://user-images.githubusercontent.com/70941806/206569560-6005287c-c417-4a45-a2bd-440dd63b415e.png)


# Dovineowuor.app requests failure report
Last week, it was reported that the Dovineowuor.app platform was returning 500 Error on all requests made on the platform routes, all the services were down.  90% of the users were affected. The root cause was the failure of our master server web-01.

## Timeline
The error was realized on Saturday October 1200 hours (East Africa Time) when our Site Reliability Engineer, Mr Elie saw the master server lagging in speed. Our engineers on call disconnected the master server web-01 for further system analysis and channelled all requests to client server web-02. They soled problem by Sunday 27th October 2200 hours (East Africa Time).

## Root cause and resolution
The Dovineowuor.app platform is served by aws cloud servers. The master server web-01 was connected to serve all requests, and it stopped functioning due to memory outage as a results of so many requests because during a previous test, the client server web-02 was disconnected temporarily for testing and was not connected to the load balancer afterwards. 


The issue was fixed when the master server was temporarily disconnected for memory clean-up then connected back to the loadbalancer and round-robin algorithm was configured so that both the master and client servers can handle equal amount of requests.

## Measures against such problem in future
- Choose the best loadbalancing algorithm for your programs
- Always keep an eye on your servers to ensure they are running properly
- Have extra back-up servers to prevent your program fro completely going offline during an issue