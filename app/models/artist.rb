class Artist < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_many :albums
  has_many :labels, -> { uniq }, through: :albums

  # Validations ----------------------------------------------------------------
  validates :name, presence: true, uniqueness: true
  validate :uniqueness_of_names_containing_the

  def uniqueness_of_names_containing_the
    return unless name[0,4] == 'The ' #Thelonious Monk <--that should totes be a test

    # check in the db if I've already got an Aritst using the preferred variant
    modified_name = name.gsub(/^The\s+/, '') + ', The'

    # add an error if the modified name is in the database
    if Artist.where(name: modified_name).count > 0
      errors.add(:name_variant, "Some fancy error message about #{modified_name}.")
    end
  end
end
