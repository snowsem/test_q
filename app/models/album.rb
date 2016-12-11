class Album < ApplicationRecord
  has_many :photos

  belongs_to :user, optional: true
  validates :title, :presence => true, :uniqueness => true

end
