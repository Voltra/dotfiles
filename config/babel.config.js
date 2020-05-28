const envLoaded = require("dotenv").config();
const mode = process.env.NODE_ENV || "production"
const dev = mode === "development";

module.exports = api => {
    api.cache(!dev);


    return {
        presets: [
            ["@babel/preset-env", {
                targets: "> 0.25%, not dead",
                modules: false, //"umd",
                useBuiltIns: false,
                /*useBuiltIns: "usage",
                corejs: 3,*/
            }]
        ],
        plugins: [
//            "@babel/plugin-transform-runtime", // async + await
            "module:regenerator-transform",
            "@babel/plugin-syntax-dynamic-import", // import()
            "@babel/plugin-proposal-class-properties",
            "@babel/plugin-syntax-jsx",
            "babel-plugin-transform-vue-jsx",
            "babel-plugin-jsx-v-model",
            "babel-plugin-transform-function-bind", // ::this.method
            "babel-plugin-pattern-matching",
        ],
    };
};
