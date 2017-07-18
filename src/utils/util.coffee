exports.getNamespace = (namespace) ->
  return '' unless namespace?
  return "/#{namespace}" if namespace isnt '' and namespace.indexOf('/') isnt 0 # add / if namespace doesn't start with it
  return namespace

# The maximum and minimum are inclusive
exports.getRandomInt = (min, max) ->
  min = Math.ceil min
  max = Math.floor max
  return Math.floor(Math.random() * (max - min + 1)) + min
