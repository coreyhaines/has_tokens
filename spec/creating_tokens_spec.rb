require 'has_tokens'

class WantsOneToken
  HasTokens.on self

  attr_accessor :public_token

  has_tokens :public => 5
end


describe "Creating a single token with #generate_tokens" do
  let(:tokened) { WantsOneToken.new }
  before do
    tokened.generate_tokens
  end

  it "sets the appropriate token property" do
    tokened.public_token.should_not be_nil
  end

  describe "the generated token" do
    it 'is unique' do
      tokened2 = WantsOneToken.new
      tokened2.generate_tokens
      tokened.public_token.should_not == tokened2.public_token
    end

    it "has the length that was given" do
      tokened.public_token.length.should == 5
    end
  end
end

