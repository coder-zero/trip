// vue.config.js
const path = require("path");
function resolve(dir) {
    return path.join(__dirname, dir);
}

module.exports = {
    productionSourceMap: false,
    lintOnSave: false,
    chainWebpack: config => {
        config.resolve.alias
            .set("@", resolve("src"))
    },
    devServer: {
        proxy: {
            '/trip': {
                target: 'http://192.168.1.104:8800',
                ws: true,
                changOrigin: true,
            },
        }
    }
}
