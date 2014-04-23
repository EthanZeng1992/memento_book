FactoryGirl.define do
  factory :group do 
    id         { rand(10000) }
    name       { FactoryGirl.generate(:name)}
    deleted_at nil
  end
end
