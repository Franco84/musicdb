class Artist < ApplicationRecord
  has_many :albums
  has_many :songs, :through => :albums
  validates_uniqueness_of :name, :case_sensitive => false 
end
