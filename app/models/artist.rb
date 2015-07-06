class Artist < ActiveRecord::Base
  has_many :albums
  has_many :labels, -> { uniq }, through: :albums
end
