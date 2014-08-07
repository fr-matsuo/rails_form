class Account < ActiveRecord::Base
  validates :first_name, :last_name,
    presence: true,
    length:{maximum: 50, allow_blank:true}
  
  validates :sex,
    presence: true,
    inclusion:{in: ['男性', '女性'], allow_blank:true}
  
  validates :post_first,
    presence: true,
    format: {with: /\A[0-9]{3}\z/, allow_blank:true}
  
  validates :post_last,
    presence: true,
    format: {with: /\A[0-9]{4}\z/, allow_blank:true}
  
  validates :prefecture,
    presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 1,
      less_than_or_equal_to:   47,
      allow_blank:true
    }

  validates :email,
    presence: true,
    format: {with: /\A[A-Za-z][0-9A-Za-z-_.]*@[A-Za-z][0-9A-Za-z-_.]*[A-Za-z]\z/, allow_blank:true}
    
  #validates :other_hobby
    
end
