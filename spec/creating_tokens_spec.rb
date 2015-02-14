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
    expect(tokened.public_token).not_to be_nil
  end

  describe "the generated token" do
    it 'is unique' do
      tokened2 = WantsOneToken.new
      tokened2.generate_tokens
      expect(tokened.public_token).not_to eq(tokened2.public_token)
    end

    it "has the length that was given" do
      expect(tokened.public_token.length).to eq(5)
    end
  end
end

class WantsMultipleTokens
  HasTokens.on self

  attr_accessor :public_token, :admin_token

  has_tokens :public => 5, :admin => 10
end

describe "Creating multiple tokens with #generate_tokens" do
  let(:tokened) { WantsMultipleTokens.new }
  before do
    tokened.generate_tokens
  end

  it "sets all the token properties" do
    expect(tokened.public_token).not_to be_nil
    expect(tokened.admin_token).not_to be_nil
  end

  it "has the length that was given for each token" do
    expect(tokened.public_token.length).to eq(5)
    expect(tokened.admin_token.length).to eq(10)
  end

  it "does not over-write an existing token" do
    tokened = WantsMultipleTokens.new
    tokened.admin_token = "existing"
    tokened.generate_tokens
    expect(tokened.admin_token).to eq("existing")
  end
end
