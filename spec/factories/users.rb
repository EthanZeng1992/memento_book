# Copyright (c) 2014 Aaron Zeng
#
# Memento Book
#-------------------------------------------------------------------------------
FactoryGirl.define do
  factory :user do
    username              { FactoryGirl.generate(:username) }
    email                 { Faker::Internet.email }
    #admin                 false
    password_hash         Authlogic::Random.hex_token
    password_salt         Authlogic::Random.hex_token
    persistence_token     Authlogic::Random.hex_token
    perishable_token      Authlogic::Random.friendly_token
    #single_access_token   Authlogic::Random.friendly_token
    last_request_at       { FactoryGirl.generate(:time) }
    current_login_at      { FactoryGirl.generate(:time) }
    last_login_at         { FactoryGirl.generate(:time) }
    last_login_ip         "127.0.0.1"
    current_login_ip      "127.0.0.1"
    login_count           { rand(100) + 1 }
    deleted_at            nil
    updated_at            { FactoryGirl.generate(:time) }
    created_at            { FactoryGirl.generate(:time) }
    #suspended_at          nil
    password              "password"
    password_confirmation "password"
  end
end

