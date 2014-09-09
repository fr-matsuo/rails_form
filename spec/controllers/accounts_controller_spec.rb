require 'rails_helper'

RSpec.describe AccountsController, :type => :controller do
  let!(:pass_param) {
    {
      'first_name'    => 'first_name',
      'last_name'     => 'last_name',
      'sex'           => '男性',
      'post_first'    => '111',
      'post_last'     => '2233',
      'prefecture_id' => 44,
      'email'         => 'test@edsample.com',
      'hobby'         => '音楽鑑賞,その他',
      'other_hobby'   => 'other_hobby',
      'opinion'       => 'opinion'
    }
  }

  describe "GET index" do
    it "has index action" do
      get :index
      expect(response).to be_success
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET new" do
    it "has new action" do
      get :new
      expect(response).to be_success
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end

    it "assigns an account" do
      get :new
      account = assigns[:account]
      expect(account).not_to be_nil
    end
  end

  describe "POST new" do
    it "has new action" do
      post(:new, account: pass_param) 
      expect(response).to be_success
    end

    it "renders the new template" do
      post(:new, account: pass_param) 
      expect(response).to render_template("new")
    end

    it "assigns an account" do
      post(:new, account: pass_param) 
      account = assigns[:account]
      expect(account).not_to be_nil
    end
  end

  describe "POST check" do
    it "has check action" do
      post(:check, account: pass_param)
      expect(response).to be_success
    end

    it "renders the new template when invalid params" do
      pass_param[:first_name] = ''
      post(:check, account: pass_param)
      expect(response).to render_template('new')
    end

    it "renders the check template when valid params" do
      post(:check, account: pass_param)
      expect(response).to render_template('check')
    end
  end

  describe "POST finish" do
    it "has finish action" do
      post(:finish, account: pass_param)
      expect(response).to be_success
    end

    it "renders the finish template when add record" do
      post(:finish, account: pass_param)
      expect(response).to render_template('finish')
    end 

    it "redirect to new when return" do
      post(:finish, account: pass_param, toNew: '戻る')
      expect(response).to redirect_to('/accounts/new')
    end
  end
end
