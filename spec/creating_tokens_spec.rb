require 'has_tokens'

class WantsOneToken
  HasTokens.on self

  attr_accessor :public_token

  has_tokens :public => 5
end


describe "Creating a single token with #generate_tokens" do
  it "sets the appropriate token property" do
    tokened = WantsOneToken.new
    tokened.generate_tokens
    tokened.public_token.should_not be_nil
  end
end
