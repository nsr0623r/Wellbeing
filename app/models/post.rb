class Post < ApplicationRecord
  has_one :physiology
  has_one :physical_symptom
  has_one :mental_manifestation
  has_one :graph
  has_one :calenda
end
