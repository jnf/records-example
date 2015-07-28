class Album < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  belongs_to :artist
  belongs_to :label

  # Validations ----------------------------------------------------------------
  validates :title, presence: true
  validates :released_year, presence: true,
            numericality: { only_integer: true }, length: { is: 4 }
  validates :format, presence: true
  validates :label_code, presence: true

  # Mounted Objects ------------------------------------------------------------
  mount_uploader :image, ImageUploader

  # Scopes ---------------------------------------------------------------------
  scope :on, -> (label) { where(label: label) }
  scope :available_formats, -> { select(:format).distinct.order(:format).pluck(:format) }
end
