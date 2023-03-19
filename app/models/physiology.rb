class Physiology < ApplicationRecord
  belongs_to :post
  
  enum menstrual_blood_volume: {menstrual_blood_little: 0, menstrual_blood_a_little: 1, menstrual_blood_normal: 2, menstrual_blood_some: 3, menstrual_blood_much: 4}
  enum cramps: {cramps_none: 0, cramps_light: 1, cramps_somewhat: 2, cramps_heavy: 3}
end
