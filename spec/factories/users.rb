# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    provider 'MyString'
    uid 'MyString'
    name 'MyString'
    email 'MyString'
  end
end
