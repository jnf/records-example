class Artist < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_many :albums
  has_many :labels, -> { uniq }, through: :albums

  # Validations ----------------------------------------------------------------
  validates :name, presence: true, uniqueness: true

  # Callbacks ------------------------------------------------------------------
  before_validation :normalize_casing_in_names!,
                    :normalize_names_with_the!

  def normalize_names_with_the!
    # converts 'The Clash' to 'Clash, The'
    return unless self.name[0,4] == 'The '

    self.name = self.name.gsub(/^The\s+/, '') + ', The'
  end

  def normalize_casing_in_names!
    # converts 'the clash' to 'The Clash'
    self.name = self.name.titlecase
  end
end
