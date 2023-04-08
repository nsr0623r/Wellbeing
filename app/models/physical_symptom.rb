class PhysicalSymptom < ApplicationRecord
  belongs_to :post
  
  enum defecute: {defecute_good: 0, constipated: 1, diarrhea: 2}
  enum vaginal_discharge: {vaginal_discharge_little: 0, vaginal_discharge_normal: 1, vaginal_discharge_a_lot: 2}
  enum vaginal_discharge_type: {stickiness: 0, cream: 1, stillness: 2, watery: 3, in_large_drops: 4}
  enum vaginal_bleeding: {vaginal_bleeding_little: 0, vaginal_bleeding_existing: 1, vaginal_bleeding_a_lot: 2}
  enum sex: {unprotected: 0, contraceptive: 1}
end
