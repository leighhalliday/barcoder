class BarcodesController < ApplicationController
  def show
    require 'barby'
    require 'barby/barcode/code_128'
    require 'barby/outputter/png_outputter'

    barcode = Barby::Code128B.new(params[:number])
    image = barcode.to_png(:height => 20, :margin => 5)
    send_data image, type: 'image/png', disposition: 'inline'
  end
end
