let _ = require('lodash');
let discovery = require('sdiscovery');


function getWinstonLogger(){

  let winston = require('winston');

  return new (winston.Logger)({
      transports: [
        new (winston.transports.Console)(),
        new (winston.transports.File)({ filename: 'logs/service.log' })
      ]
    });
}

function getBunyanLogger(){
  let bunyan = require('bunyan');

  try{
    return bunyan.createLogger({name: discovery.whoami().name });
  }catch(e){
    return bunyan.createLogger({name: 'host'});
  }
};


function newError(message, status) {
    let error = new Error(message);
    error.status = status;
    return error;
}

function propagateError(next) {
    return function(message, status) {
        next(newError(message, status));
    }
}

function makeDBError(next) {
    return function() {
        newError(next, "Error in the database", 500);
    }
}

/*
  buildURL expect an object of the type {service, port};
*/
function toMongoURL(discover, dbName){
  let url = 'mongodb://@'+discover.service +':'+ discover.port+'/'+ (discover.db || dbName);

  if(!_.isUndefined(discover.user) && !_.isUndefined(discover.password))
    return mongoCredentials(url, discover.user, discover.password);

  return url;
}

// Modify mongodb url to add user and passw
function mongoCredentials(url, user, passw){
  return url.replace('@', user + ':' + passw + '@');
}


module.exports = {
    newError: newError,
    dbError: makeDBError,
    propagateError: propagateError,
    toMongoURL: toMongoURL,
    Logger: getBunyanLogger(), // getWinstonLogger()
};
