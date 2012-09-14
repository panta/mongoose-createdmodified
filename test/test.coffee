chai = require 'chai'
assert = chai.assert
expect = chai.expect
should = chai.should()
mongoose = require 'mongoose'

index = require '../src/index'

db = mongoose.createConnection('localhost', 'mongoose_createdmodified_tests')
db.on('error', console.error.bind(console, 'connection error:'))

Schema = mongoose.Schema
ObjectId = Schema.ObjectId

SimpleSchema = new Schema
  name: String
  title: String

describe 'WHEN working with the plugin', ->
  before (done) ->
    done()

  after (done) ->
    SimpleModel = db.model("SimpleModel", SimpleSchema)
    SimpleModel.remove {}, (err) ->
      return done(err)  if err
    done()

  describe 'library', ->
    it 'should exist', (done) ->
      should.exist index
      done()

  describe 'adding the plugin', ->
    it 'should work', (done) ->
      SimpleSchema.plugin index.createdModifiedPlugin, {index: true}
      SimpleModel = db.model("SimpleModel", SimpleSchema)
  
      instance = new SimpleModel({name: 'testName', title: 'testTitle'})
      should.exist instance
      instance.should.have.property 'name', 'testName'
      instance.should.have.property 'title', 'testTitle'
      instance.should.have.property 'created'
      instance.should.have.property 'modified'
      should.not.exist(instance.created)
      should.not.exist(instance.modified)

      instance.save (err) ->
        return done(err)  if err
        should.exist(instance.created)
        should.exist(instance.modified)
        instance.created.should.be.instanceof(Date)
        instance.modified.should.be.instanceof(Date)
        instance.modified.should.not.be.below(instance.created)
        done()
