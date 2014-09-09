require 'rails_helper'

RSpec.describe Account, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  fixtures :accounts

  before(:each) do
     @account = accounts(:pass_data) 
  end

  it "needs first_name" do
    @account.first_name = nil
    expect(@account).not_to be_valid
  end

  it "needs first_name less than 51 chars" do
    @account.first_name = '123456789012345678901234567890123456789012345678901'
    expect(@account).not_to be_valid
  end

  it "needs last_name" do
    @account.last_name = nil
    expect(@account).not_to be_valid
  end

  it "needs last_name less than 51 chars" do
    @account.last_name = '123456789012345678901234567890123456789012345678901'
    expect(@account).not_to be_valid
  end

  it "needs sex" do
    @account.sex = nil
    expect(@account).not_to be_valid
  end

  it "needs post_first" do
    @account.post_first = nil
    expect(@account).not_to be_valid
  end

  it "needs post_first of 3 chars" do
    @account.post_first = '4444'
    expect(@account).not_to be_valid
  end

  it "needs post_first as numeric" do
    @account.post_first = 'foo'
    expect(@account).not_to be_valid
  end

  it "needs post_last" do
    @account.post_last = nil
    expect(@account).not_to be_valid
  end

  it "needs post_last of 4 chars" do
    @account.post_last = '333'
    expect(@account).not_to be_valid
  end

  it "needs post_last as numeric" do
    @account.post_last = 'hoge'
    expect(@account).not_to be_valid
  end

  it "needs prefecture_id" do
    @account.prefecture_id = nil
    expect(@account).not_to be_valid
  end

  it "needs email" do
    @account.email = nil
    expect(@account).not_to be_valid
  end
end
