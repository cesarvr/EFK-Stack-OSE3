### Logging examples 

#### getBunyanLogger

Handle the instanciation and configuration of [Bunyan](https://github.com/trentm/node-bunyan) Logger API, - *I prefer this one because is almost zero-configuration needed and ready to work*.  

#### getWinstonLogger

Handle the instanciation and configuration of [Winston](https://github.com/winstonjs/winston) Logger API. Less trivial but support more configurations.


#### Example

At the end in our code we consume this the following way:

```javascript

//util.js

module.exports = {
  ...
  Logger: getBunyanLogger(), // getWinstonLogger()
  ...
}

// usage

let logger = require('./lib/util').Logger;
logger.info('hello world');

// {"name":"host",
//"hostname":"vagrant-ubuntu-trusty-64",
// "pid":2090,"level":30,
//"msg":"hello world",
//"time":"2016-10-27T13:23:58.975Z","v":0}
```


[Application example](https://bitbucket.org/bankaudigroup/cesar-template).
