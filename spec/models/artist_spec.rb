require 'rails_helper'

RSpec.describe Artist, type: :model do
  context "knows how to validate artist names that start with 'The'" do
    # positive case - prefers Clash, The over The Clash
    it "doesn't validate 'The Clash' if 'Clash, The' already exists" do
      Artist.create(name: "Clash, The")

      the_clash = Artist.new(name: 'The Clash')

      expect(the_clash).to_not be_valid
      expect(the_clash.errors.keys).to include(:name_variant)
    end

    # 'false positive' negative case?
    it "shouldn't flag Thelonious Monk as invalid" do
      thelonious_monk = Artist.new(name: 'Thelonious Monk')

      expect(thelonious_monk).to be_valid
      expect(thelonious_monk.errors.keys).to_not include(:name_variant)
    end
  end
end
