class Account < ActiveRecord::Base
  belongs_to :prefecture

  validates :first_name,
    presence: { message: '姓を入力してください。' },
    length:{
      maximum: 50,
      message: '姓は%{count}文字以内で入力してください。',
      allow_blank:true
    }
  
  validates :last_name,
    presence: { message: '名を入力してください。'},
    length:{
      maximum: 50,
      message: '名は%{count}文字以内で入力してください。',
      allow_blank:true
    }

  validates :sex,
    presence: { message: '性別を選択してください。' },
    inclusion:{in: ['男性', '女性'], allow_blank:true}
  
  validates :post_first,
    presence: { message: '郵便番号を入力してください' },
    format: {
      with: /\A[0-9]{3}\z/,
      message: '郵便番号を正しく入力してください。',
      allow_blank:true
    }
  
  validates :post_last,
    presence: { message: '郵便番号を入力してください' },
    format: {
      with: /\A[0-9]{4}\z/,
      message: '郵便番号を正しく入力してください。',
      allow_blank:true
    }
  
  validates :prefecture_id,
    presence: { message: '都道府県を選択してください。' },
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 1,
      less_than_or_equal_to:   47,
      message: '都道府県を選択してください。',
      allow_blank:true
    }

  validates :email,
    presence: { message: 'メールアドレスを入力してください。' },
    format: {
      with: /\A[A-Za-z][0-9A-Za-z-_.]*@[A-Za-z][0-9A-Za-z-_.]*[A-Za-z]\z/,
      message: 'メールアドレスを正しく入力してください。',
      allow_blank:true
    }
    
  validates :other_hobby,
    presence: {
      if: Proc.new {|ac| ac.hobby.include?('その他')},
      message: 'その他の詳細を入力してください。'
    }
    
end
