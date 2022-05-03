const webpack = require('webpack')
module.exports = {
	productionSourceMap: false, // 生产打包时不输出map文件，增加打包速度
    // chainWebpack: config => {
	// 	config.plugin('provide').use(webpack.ProvidePlugin, [{
	// 	'window.Quill': 'quill'
	// 	}])
	// }

	//外层需要加上  configureWebpack ，否则启动会出现  Invalid options in vue.config.js: "plugins" is not allowed
	configureWebpack: {
		//解决quill安装图片缩放功能引入时出现 Cannot read property 'imports' of undefined
        plugins: [
			new webpack.ProvidePlugin({
			  'window.Quill': 'quill/dist/quill.js',
			  'Quill': 'quill/dist/quill.js'
			})
		  ]
    },

	devServer: {
		open: true
		// host:'localhost',
		// headers:{
		// 	'Access-Control-Allow-Origin':'*'
		// },
		// hotOnly:false,
		// disableHostCheck:true//解决不了控制台报错  [WDS] Disconnected
			
	}
	

}
