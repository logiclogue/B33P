const path = require("path");

module.exports = {
    entry: "./src/main.bs.js",
    output: {
        filename: "main.js",
        path: path.resolve(__dirname, "dist")
    },
    mode: "development",
    watch: true
};
