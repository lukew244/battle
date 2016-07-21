require 'player'

describe Player do
  subject(:mike) { Player.new('Mike') }

  describe '#name' do
    it 'returns the name' do
      expect(mike.name).to eq 'Mike'
    end
  end

  describe '#receive_damage' do
    it 'takes damage' do
      mike.receive_damage
      expect(mike.hit_points).to eq 90
    end
  end


end
