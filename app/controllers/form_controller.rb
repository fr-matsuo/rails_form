class FormController < ApplicationController
  def index
    @position = 'フォーム＞TOPページ'
  end

  def new
    @position = 'フォーム＞入力'
  end

  def check
    @position = 'フォーム＞確認'
  end

  def create
    @position = 'フォーム＞完了'
  end
end
