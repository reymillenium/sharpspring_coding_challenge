const {environment} = require('@rails/webpacker')

// Works the popovers and tooltips but not the animations:
// const webpack = require('webpack');
// environment.plugins.append('Provide',
//     new webpack.ProvidePlugin({
//         $: 'jquery',
//         jQuery: 'jquery',
//         Popper: ['popper.js', 'default']
//     }));

// Works the animations but not the popovers and tooltips:
// const webpack = require('webpack')
// environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
//     $: 'jquery/src/jquery',
//     jQuery: 'jquery/src/jquery',
//     jquery: 'jquery',
//     'window.jQuery': 'jquery',
//     Popper: ['popper.js', 'default']
// }))

// Works the animations and also works the popovers and tooltips:
const webpack = require('webpack')
environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery/src/jquery',
    jquery: 'jquery',
    'window.jQuery': 'jquery',
    Popper: ['popper.js', 'default']
}))

module.exports = environment
