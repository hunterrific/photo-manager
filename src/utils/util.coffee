exports.getNamespace = (namespace) ->
  return '' unless namespace?
  return "/#{namespace}" if namespace isnt '' and namespace.indexOf('/') isnt 0 # add / if namespace doesn't start with it
  return namespace
