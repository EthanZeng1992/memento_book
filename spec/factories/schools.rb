FactoryGirl.define do
  factory :school do 
    id         { rand(10000) }
    name       { FactoryGirl.generate(:name)}
    deleted_at nil
  end
end
