json.array!(@members) do |member|
  json.extract! member, :id, :name, :email, :phone, :QQ, :address, :group_id
  json.url member_url(member, format: :json)
end
