const path = require('path');

module.exports = {
  entry: "./frontend/widgets.jsx",
  output: {
      path: path.resolve(__dirname),
      filename: "bundle.js"
  },
  module: {
    rules: [
      {
        test: [/\.jsx?$/],
        exclude: /(node_modules)/,
        use: {
          loader: 'babel-loader',
          query: {
            presets: ['env', 'react']
          }
        },
      }
    ]
  },
  devtool: 'source-map',
  // resolve allows for the non-specification of extensions in file reqs
  resolve: {
    extensions: ['.js', '.jsx', '*']
  },

};
