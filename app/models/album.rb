class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs
  validates_uniqueness_of :title, :case_sensitive => false

end
