## About mongoose-createdmodified

[mongoose][] plugin that adds created and modified fields to a mongoose schema.

## Install

npm install mongoose-createdmodified

## Usage

### JavaScript

```javascript
var mongoose = require('mongoose');
var createdModifiedPlugin = require('mongoose-createdmodified').createdModifiedPlugin;

...

var SampleSchema = new Schema({
  ...
});
SampleSchema.plugin(createdModifiedPlugin, {index: true});
var SampleModel = db.model("SampleModel", SampleSchema);
```

### [CoffeeScript][]

```coffeescript
mongoose = require 'mongoose'
createdModifiedPlugin = require 'mongoose-createdmodified'.createdModifiedPlugin

...

SampleSchema = new Schema
  ...
SampleSchema.plugin createdModifiedPlugin, {index: true}
SampleModel = db.model("SampleModel", SampleSchema)
```

## Bugs and pull requests

Please use the github [repository][] to notify bugs and make pull requests.

## License

This software is © 2012 Marco Pantaleoni, released under the MIT licence. Use it, fork it.

See the LICENSE file for details.

[mongoose]: http://mongoosejs.com
[CoffeeScript]: http://jashkenas.github.com/coffee-script/
[Node.js]: http://nodejs.org/
[Mocha]: http://visionmedia.github.com/mocha/
[repository]: http://github.com/panta/mongoose-createdmodified
