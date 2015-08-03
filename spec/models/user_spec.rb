require 'rails_helper'

describe User do
  before do
    @user = User.new
    @user.username  = "だんちょ"
    @user.password = "12345678"
    @user.email = "aaa@dancho.jp"
  end

  subject{@user}

  it { is_expected.to respond_to(:username) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:password) }
  it { is_expected.to respond_to(:password_confirmation)}
  it { is_expected.to respond_to(:crypted_password)}

  it { is_expected.to be_valid}

  describe "when username is not present" do
    before { @user.username = "" }
    it { is_expected.not_to be_valid }
  end

  describe "when username is over 10 chars" do
    before { @user.username = "１２３４５６７８９０１"}
    it { is_expected.not_to be_valid }
  end

  describe "when username is 10 chars" do
    before { @user.username = "１２３４５６７８９０"}
    it { is_expected.to be_valid }
  end


  describe "when email is not present" do
    before { @user.email = "" }
    it { is_expected.not_to be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo..com user_at_foo,org example.user@foo.foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        is_expected.not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        is_expected.to be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      #@userと同一の属性をuser_with_same_emailコピー
      user_with_same_email = @user.dup
      #メールアドレスでは大文字小文字が区別されないため、upcaseで統一。
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { is_expected.not_to be_valid }
  end

  describe "when password is not present" do
    before do
      @user.password = ""
    end

    it { is_expected.not_to be_valid}
  end


end
