module.exports = [
    '>$js-to-json',  # The '>' means runs at the 'afterSave' point in the module. The '$' its a a module. See https://github.com/anodynos/uRequire/blob/6eddeb1ae1e5e69514549464bce518e110d3ce16/source/code/config/ResourceConverter.coffee#L283

  '''Converts a .js value (eg its module.exports value) to a .json file.
     It runs at the `afterSave` stage for each module, requires the destination .js module,
     then it JSON.stringifies it and deletes the dst .js file.

    Thanks to ResourceConverter's architecture, it works with
     * any .coffee, .ts, .ls etc
     * and also any AMD, commonJs, es6 etc module.

    See more at http://urequire.org/resourceconverters.coffee#the-alternative-less-verbose-array-way'''

  [/./]


  (m)->
    json = JSON.stringify m.requireClean(m.dstRealpath), null, '  '
    m.clean m.dstFilepath
    json

  '.json'
]
