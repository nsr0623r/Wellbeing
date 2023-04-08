class Post < ApplicationRecord
  has_one :physiology
  has_one :physical_symptom
  has_one :mental_manifestation
end
