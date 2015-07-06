class Album < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  belongs_to :artist
  belongs_to :label

  # Validations ----------------------------------------------------------------
  # validates :title, presence: true
  # validates :released_year, presence: true, numericality: true
  # validates :format, presence: true
  # validates :label_code, presence: true

  # Scopes ---------------------------------------------------------------------
  scope :on, -> (label) { where(label: label) }
end
