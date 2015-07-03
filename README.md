# ActiveModelSerializers Contrib

Extend AMS with classes/modules.

Currently, it assumes that you're using `kaminari` to paginate. This has not been tested with `will_paginate`.

# Usage

## ActiveModel::PaginationSerializer

```ruby
class BooksController < ApplicationController
  respond_to :json

  def index
    book = Book.page(params[:page])
    respond_with book, serializer: ActiveModel::PaginationSerializer
  end
end
```

You will get a response like this:

```json
{
  "books": [
    { "id": 1, "name": "The Great Voyage" },
    { "id": 2, "name": "The Great Voyage part 2" }
  ],
  "meta": {
    "current_page": 1,
    "total_pages": 4,
    "total": 8,
    "prev_page": null,
    "next_page": 2
  }
}
```

# License

Copyright 2015 G5

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
