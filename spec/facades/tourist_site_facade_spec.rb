require 'rails_helper'

RSpec.describe TouristSiteFacade do
  let(:country) { 'France' }
  let(:capital) { [48.87, 2.33] }
  let(:location_data) { [{:type=>"Feature",
      :properties=>{
        :name=>"Palais du Louvre",
        :formatted=>"Louvre Palace, Place du Lieutenant Henri Karcher, 75001 Paris, France",
        :place_id=>"asdfasdfasdf"}
        }] }

  describe 'instantiation' do
    it 'can be instantiated' do
      expect(TouristSiteFacade.new).to be_an_instance_of(TouristSiteFacade)
    end
  end

  describe '.search' do
    before do
      allow(RestCountriesService).to receive(:get_capital).with(country).and_return(capital)
      allow(GeoapifyService).to receive(:search).with(capital).and_return(location_data)
    end

    it 'uses country data via argument' do
      expect(RestCountriesService).to receive(:get_capital).with(country)
      expect(GeoapifyService).to receive(:search).with(capital)
      TouristSiteFacade.search(country)
    end

    it 'returns data through its method' do
      results = TouristSiteFacade.search(country)
      expect(results).to all(be_a(TouristSite))
      expect(results.first.name).to eq('Palais du Louvre')
      expect(results.first.address).to eq('Louvre Palace, Place du Lieutenant Henri Karcher, 75001 Paris, France')
      expect(results.first.place_id).to eq('asdfasdfasdf')
    end
  end
end
