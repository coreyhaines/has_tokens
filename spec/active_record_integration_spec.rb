require 'has_tokens'

class ActiveRecordDummyWithTokens
  HasTokens.on self
  attr_accessor :public_token, :admin_token

  has_tokens :public => 5, :admin => 10
end


describe "Looking up by the tokens with for_<token_name>" do
  it "calls the appropriate ActiveRecord finder" do
    admin_version = stub
    ActiveRecordDummyWithTokens.should_receive(:find_by_admin_token!).with("admin_token") { admin_version }
    ActiveRecordDummyWithTokens.for_admin("admin_token").should be(admin_version)
    public_version = stub
    ActiveRecordDummyWithTokens.should_receive(:find_by_public_token!).with("public_token") { public_version }
    ActiveRecordDummyWithTokens.for_public("public_token").should be(public_version)
  end
end
