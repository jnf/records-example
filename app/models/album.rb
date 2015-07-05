class Album < ActiveRecord::Base
  belongs_to :artist
  belongs_to :label

  scope :on, -> (label) { where(label: label) }
end
