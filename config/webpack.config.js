////////////////////////////////////////////////////////////////////////////////////////////////////
//// IMPORTS
////////////////////////////////////////////////////////////////////////////////////////////////////
const { resolve } = require("path");
const fsPath = require("path");
const webpack = require("webpack");
const ManifestPlugin = require("webpack-manifest-plugin");
const { CleanWebpackPlugin } = require("clean-webpack-plugin");
const CopyWebpackPlugin = require('copy-webpack-plugin');
const VueLoaderPlugin = require("vue-loader/lib/plugin");
const SassOnceImporter = require("node-sass-once-importer");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const CompressionPlugin = require("compression-webpack-plugin");
const jsonminify = require("jsonminify");



////////////////////////////////////////////////////////////////////////////////////////////////////
//// BASE DEFINITIONS
////////////////////////////////////////////////////////////////////////////////////////////////////
const envLoaded = require("dotenv").config();
if(envLoaded.error)
	throw new Error("failed to load .env file");

const mode = process.env.NODE_ENV;
const dev = (mode === "development");
const config = {
	resolve: {
		alias: {},
		extensions: []
	},
	entry: {},
	output: {},
	module: {
		rules: []
	},
	plugins: [],
	mode,
	optimization: {
		splitChunks: {
			cacheGroups: {
			}
		}
	},
};

const path = src => resolve(__dirname, src);
const styleLoaders = [{loader: "style-loader"}, {loader: "css-loader"}];
const sassLoaders = [...styleLoaders, {
	loader: "sass-loader",
	options: {
		importer: SassOnceImporter()
	}
}];
const libraries = /(node_module|bower_component)s/gi;



////////////////////////////////////////////////////////////////////////////////////////////////////
//// TARGET
////////////////////////////////////////////////////////////////////////////////////////////////////
config.target = "web";



////////////////////////////////////////////////////////////////////////////////////////////////////
//// MODULE RESOLUTION
////////////////////////////////////////////////////////////////////////////////////////////////////
config.resolve.alias["@"] = path("src/");
config.resolve.alias["@js"] = path("src/js/");

config.resolve.alias["@vue"] = path("src/vue/");
config.resolve.alias["@components"] = path("src/vue/components/");
config.resolve.alias["@vplugins"] = path("src/vue/plugins/");

config.resolve.alias["@css"] = path("src/sass/");
config.resolve.alias["@img"] = path("src/resources/img/");

config.resolve.alias["@tools"] = path("src/js/tools/");

config.resolve.alias["@store"] = path("src/js/store/");
config.resolve.alias["@state"] = path("src/js/store/state/");
config.resolve.alias["@getters"] = path("src/js/store/getters/");
config.resolve.alias["@mutations"] = path("src/js/store/mutations/");

config.resolve.alias["$vue"] = "vue/dist/vue.esm.js";
config.resolve.alias["$mvue"] = "vue/dist/vue.min.js";
config.resolve.alias["$localStorage"] = "store";
config.resolve.alias["$vueTypes"] = "vue-types/es/shim.js";
config.resolve.alias["$sequency"] = "sequency/lib-umd/sequency.min.js";

config.resolve.extensions = [
	"js",
	"vue",
	"scss",
	"css"
].map(ext => `.${ext}`);



////////////////////////////////////////////////////////////////////////////////////////////////////
//// ENTRIES
////////////////////////////////////////////////////////////////////////////////////////////////////
config.entry["index"] = "@js/index.js";



////////////////////////////////////////////////////////////////////////////////////////////////////
//// OUTPUTS
////////////////////////////////////////////////////////////////////////////////////////////////////
config.output["path"] = path("dist/assets/");
config.output["filename"] = "js/[name].bundle.js";
config.output["publicPath"] = "/assets/";
config.output["pathinfo"] = false; // optimization



////////////////////////////////////////////////////////////////////////////////////////////////////
//// DEV TOOLS
////////////////////////////////////////////////////////////////////////////////////////////////////
config.devtool = dev ? 'inline-source-map' : false;



////////////////////////////////////////////////////////////////////////////////////////////////////
//// OPTIMIZATION
////////////////////////////////////////////////////////////////////////////////////////////////////
config.optimization["minimize"] = !dev;
config.optimization["nodeEnv"] = mode;



////////////////////////////////////////////////////////////////////////////////////////////////////
//// MODULES/LOADERS
////////////////////////////////////////////////////////////////////////////////////////////////////
config.module.rules.push({
	test: /\.js$/i,
	exclude: libraries,
	use: [
		"babel-loader",
	]
});

const miniCssLoader = {
	loader: MiniCssExtractPlugin.loader,
	options: {
		hmr: false,
	}
};

config.module.rules.push({
    test: /\.css$/i,
    use: [
		miniCssLoader,
		...styleLoaders.splice(1),
	],
});

config.module.rules.push({
	test: /\.s[ac]ss$/i,
    use: [
		miniCssLoader,
		...sassLoaders.splice(1),
	],
});

config.module.rules.push({
	test: /\.(png|svg|jpg|gif)$/i,
	use: [
		"file-loader",
	]
});

config.module.rules.push({
	test: /\.(woff2?|eot|ttf|otf)$/i,
	use: [
		"file-loader",
	]
});

const vueLoaders = `vue-style-loader${sassLoaders.map(e=>`!${e.loader}`).join("")}`;
config.module.rules.push({
	test: /\.vue$/i,
	loader: "vue-loader",
    options: {
		loaders: {
			css: vueLoaders,
			scss: vueLoaders,
			sass: vueLoaders,
		}
	},
});



////////////////////////////////////////////////////////////////////////////////////////////////////
//// PLUGINS
////////////////////////////////////////////////////////////////////////////////////////////////////
config.plugins.push(new webpack.EnvironmentPlugin(["NODE_ENV"]));

config.plugins.push(new VueLoaderPlugin());

/* config.plugins.push(extractCSS);
config.plugins.push(extractSASS); */

config.plugins.push(new MiniCssExtractPlugin({
	filename: "css/[name].bundle.css",
}));

const transform = (content, path) => {
	if(/\.json$/gi.test(path))
		return jsonminify(content.toString());

	return content;
};
config.plugins.push(new CopyWebpackPlugin([{ //Copier les images
	from: "src/resources/",
	to: "../assets/",
	transform,
}, {
    from: "src/pwa/",
    to: "../",
	transform,
}]));

config.plugins.push(new CompressionPlugin({
	test: /\.(js|css)$/,
	threshold: 4096,
}));



////////////////////////////////////////////////////////////////////////////////////////////////////
//// EXPORT
////////////////////////////////////////////////////////////////////////////////////////////////////
module.exports = config;

