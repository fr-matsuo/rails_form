json.array!(@accounts) do |account|
  json.extract! account, :id, :first_name, :last_name, :sex, :post_first, :post_last, :prefecture, :email, :hobby, :other_hobby, :opinion
  json.url account_url(account, format: :json)
end
