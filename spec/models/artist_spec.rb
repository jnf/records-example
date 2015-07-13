require 'rails_helper'

RSpec.describe Artist, type: :model do
  context "normalizing and validation Artist.name" do
    it "transforms 'The Cure' into 'Cure, The'" do
      the_cure = Artist.new(name: 'The Cure')
      the_cure.normalize_names_with_the!

      expect(the_cure.name).to eq 'Cure, The'
    end

    it "doesn't transform Thelonious Monk into lonious Monk, The" do
      thelonious_monk = Artist.new(name: 'Thelonious Monk')
      thelonious_monk.normalize_names_with_the!

      expect(thelonious_monk.name).to eq 'Thelonious Monk'
    end

    it "transforms 'the cure' into 'The Cure'" do
      the_cure = Artist.new(name: 'the cure')
      the_cure.normalize_casing_in_names!

      expect(the_cure.name).to eq 'The Cure'
    end

    it "treat 'the clash' and 'Clash, The' as the same artist" do
      Artist.create(name: "Clash, The")

      # string comparison on 'the clash' == 'Clash, The'
      # code should handle casing and names with 'the'
      the_clash = Artist.new(name: 'the clash')

      expect(the_clash).to_not be_valid
      expect(the_clash.errors.keys).to include(:name)
    end
  end
end
