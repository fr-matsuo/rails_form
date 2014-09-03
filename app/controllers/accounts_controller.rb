class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @page_pos = 'フォーム＞TOPページ'
    @accounts = Account.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  # POST /accounts/new
  def new
    @page_pos = 'フォーム＞入力'

    @account = Account.new
    @hobbys = Array.new
    if request.post?
      params = account_params
      @account = Account.new(params)
      @hobbys = params['hobby'].split(',')
    end
  end

  # POST /accounts/check
  def check
    @page_pos = 'フォーム＞確認'

    @account = Account.new(adjust_params!(account_params))
    unless @account.valid?
      @hobbys = params['hobbys'] || Array.new
      render :new
      return
    end
  end

  # GET /accounts/finish
  def finish
    @page_pos = 'フォーム＞完了'
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:first_name, :last_name, :sex, :post_first, :post_last, :prefecture, :email, :hobby, :other_hobby, :opinion)
    end

    def adjust_params!(account_params)
      set_hobbys!(account_params)
      strip_texts!(account_params)
      return account_params
    end

    def set_hobbys!(account_params)
      #選択された趣味の配列を文字列に
      hobbys = params['hobbys'] || Array.new
      if account_params['other_hobby'].present? && hobbys.index('その他').nil?
        hobbys.push 'その他'
      end
      account_params['hobby'] = hobbys.join(",")
    end

    def strip_texts!(account_param)
      strip_pattern = (/^[　\s]*(.*?)[　\s]*$/)
      attrs = [:first_name, :last_name, :post_first, :post_last, :email, :other_hobby, :opinion]
      attrs.each {|attr| account_params[attr].gsub!(strip_pattern, '\1') }
    end
end
