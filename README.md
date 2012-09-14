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

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[mongoose]: http://mongoosejs.com
[CoffeeScript]: http://jashkenas.github.com/coffee-script/
[Node.js]: http://nodejs.org/
[Mocha]: http://visionmedia.github.com/mocha/
[repository]: http://github.com/panta/mongoose-createdmodified
