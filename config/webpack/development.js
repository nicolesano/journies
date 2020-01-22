process.env.NODE_ENV = process.env.NODE_ENV || 'development';
const environment = require('./environment');
const config = environment.toWebpackConfig();
config.devServer = {
    host: "localhost",
    port: 9000,
}

module.exports = config;