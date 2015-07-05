class Label < ActiveRecord::Base
  has_many :albums
  has_many :artists, -> { uniq }, through: :albums
end
