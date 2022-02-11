module StampsHelper
    require 'chunky_png'

    def qrcode_tag(url, _options = {})
        qr = ::RQRCode::QRCode.new(url)
        ChunkyPNG::Image.from_datastream(qr.as_png.to_datastream).to_data_url
    end

    def stamp_number(number)
        case number
        when 1 then
            "クリエイター"
        when 2 then
            "デザイン"
        when 3 then
            "IT"
        when 4 then   
            "テクノロジー"
        end
    end
end
