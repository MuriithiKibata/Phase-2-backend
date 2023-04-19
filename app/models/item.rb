class Item < ApplicationRecord
   belongs_to :store


   def decrease(amount)
      self.quantity -= amount
   end
end
