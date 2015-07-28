class Label < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_many :albums
  has_many :artists, -> { uniq }, through: :albums

  # Scopes ---------------------------------------------------------------------
  scope :available_labels, -> { distinct(:title).order(:title).pluck(:title, :id) }
end
