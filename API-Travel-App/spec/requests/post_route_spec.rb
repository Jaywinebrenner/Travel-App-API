require 'rails_helper'

describe "post a destination route", :type => :request do

  before do
    post '/destinations', params: { :country => 'test_country', :city => 'test_city' }
  end

  it 'returns the country name' do
    expect(JSON.parse(response.body)['country']).to eq('test_country')
  end

  it 'returns the destination city' do
    expect(JSON.parse(response.body)['city']).to eq('test_city')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:ok)
  end
end
