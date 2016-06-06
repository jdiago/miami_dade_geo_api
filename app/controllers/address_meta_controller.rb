class AddressMetaController < ApplicationController
  def index
    unless params[:address]
      render error: 'not found', status: 404
      return
    end

    address_data = MiamiDadeGeo::Address.new params[:address]
    meta_data = {
      address: params[:address],
      x: address_data.x,
      y: address_data.y,
      lat: address_data.lat,
      long: address_data.long,
      munic_code: address_data.munic_code,
      zip_code: address_data.zip
    }

    render json: meta_data
  rescue MiamiDadeGeo::InvalidAddressError
    render json: { error: 'Invalid address' }, status: 422
  end
end
