FactoryGirl.define do
  sequence :name do |n|
    Faker::Internet.user_name + n.to_s
  end

  sequence :time do |n|
    Time.now - n.hours
  end
end
