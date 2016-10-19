class Order < ApplicationRecord
  belongs_to :orderable, polymorphic: true
  belongs_to :user
end
