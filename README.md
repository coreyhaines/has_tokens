has_tokens
==========

Creates tokens for accessing ActiveRecord objects. Allows you to declaratively specify token-based access for your ActiveRecord objects.
   
Under the covers, has_tokens uses SecureRandom.hex so they'll be all "c07a2". The size is configurable, so if you need trillions, you can make that happen, man.

Install
-------

```
gem install has_tokens
```


Active Record Implementation
-------------------

1. Create a Migration to add a string "public_token" to your model
2. Index that public_token field

```
class YourSuperActiveRecordClass < ActiveRecord::Base
  HasTokens.on self
  has_tokens public: 5
  
  before_validation :generate_tokens, on: :create
  validates_uniqueness_of :public_token
  
  def self.for_token(token)
    find_by_public_token!(token)
  end
  
  def to_param
    public_token
  end
end
```

Now, your urls will be tokenized "/models/5245c"

Note, if you have a bunch of models, you'll want to generate tokens for each using generate_tokens (and then save the model).

So, you first include has_tokens in your class with `HasTokens.on self`. Then, the has_tokens will define your public_token method.


PORO (ruby object) Implementation
------------------------------

```
class YourHipsterClass
  HasTokens.on self
  has_tokens public: 5
  def initialize
    generate_tokens
  end
end
```

You know, or whatever.

Authors
-------

coreyhaines and josh cheek

License
-------
Assume all rights Corey Haines until further notice.