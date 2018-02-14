class Song < ApplicationRecord
  belongs_to :album
  validates_uniqueness_of :title, :case_sensitive => false
end
