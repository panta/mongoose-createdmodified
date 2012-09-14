mongoose = require('mongoose')

Schema = mongoose.Schema
ObjectId = Schema.ObjectId

# ---------------------------------------------------------------------
#   helper functions
# ---------------------------------------------------------------------

# Extend a source object with the properties of another object (shallow copy).
extend = (dst, src) ->
  for key, val of src
    dst[key] = val
  dst

# Add missing properties from a `src` object.
defaults = (dst, src) ->
  for key, val of src
    if not (key of dst)
      dst[key] = val
  dst

# Add a new field by name to a mongoose schema
addSchemaField = (schema, pathname, fieldSpec) ->
  fieldSchema = {}
  fieldSchema[pathname] = fieldSpec
  schema.add fieldSchema

# ---------------------------------------------------------------------
#   M O N G O O S E   P L U G I N S
# ---------------------------------------------------------------------
# http://mongoosejs.com/docs/plugins.html

createdModifiedPlugin = (schema, options={}) ->
  defaults options,
    createdName: 'created'
    modifiedName: 'modified'
    index: false
  createdName = options.createdName
  modifiedName = options.modifiedName
  addSchemaField schema, createdName,
    type: Date
    default: () -> null
  addSchemaField schema, modifiedName,
    type: Date
    default: () -> null
  schema.pre "save", (next) ->
    @[modifiedName] = new Date()
    if @.get(createdName) in [undefined, null]
      @[createdName] = new Date()
    next()

  schema.path(createdName).index options.index  if options.index
  schema.path(modifiedName).index options.index  if options.index

# -- exports ----------------------------------------------------------

module.exports =
  createdModifiedPlugin: createdModifiedPlugin
