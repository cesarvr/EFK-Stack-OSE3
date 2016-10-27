# Logging solutions for Node.js
Here are will show different strategies to and use logging API.

## Util Module

The important part here is how we expose the logger API, and we need to stream to stdout of our container, so OSE3 logger infrastructure (EFK)[https://bitbucket.org/bankaudigroup/cesar-logging-infra] can take care of this.

### Exposing the API

#### getBunyanLogger

Handle the instanciation and configuration of [Bunyan](https://github.com/trentm/node-bunyan) Logger API, I prefer this one because is almost zero-configuration needed and ready to work.  

#### getWinstonLogger

Handle the instanciation and configuration of [Winston](https://github.com/winstonjs/winston) Logger API. Less trivial but support more configurations.



At the end our microservices consume this the following way:

```javascript
let logger = require('util').Logger;
logger.info('hello world');

// {"name":"host",
//"hostname":"vagrant-ubuntu-trusty-64",
// "pid":2090,"level":30,
//"msg":"hello world",
//"time":"2016-10-27T13:23:58.975Z","v":0}
```
 
