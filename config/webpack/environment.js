const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
const dotenv = require('dotenv')

const dotenvFiles = [
    `.env.${process.env.NODE_ENV}.local`,
    '.env.local',
    `.env.${process.env.NODE_ENV}`,
    '.env'
]
dotenvFiles.forEach((dotenvFile) => {
    dotenv.config({ path: dotenvFile, silent: true })
})

environment.plugins.prepend('Environment', new webpack.EnvironmentPlugin(JSON.parse(JSON.stringify(process.env))))

const { environment } = require('@rails/webpacker')

environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
    })
)

module.exports = environment

