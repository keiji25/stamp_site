module HomesHelper
    require 'chunky_png'
    
    def stamp_list(index)
        stamp_list = ["creators", "design", "it", "tech"]
        path = "/images/stamps/#{stamp_list[index-1]}.png"
        @get_stamp.each do |get_stamp|
            if get_stamp.number == index
                begin
                    path = @stamp.find_by(number: index).image.url
                rescue
                    path = "/images/noimage.png"
                end
            end
        end
        path
    end

    def qrcode_tag(url, _options = {})
        qr = ::RQRCode::QRCode.new(url)
        ChunkyPNG::Image.from_datastream(qr.as_png.resize(200,200).to_datastream).to_data_url
    end

    # ざわつかせる
    def zawa 
        if rand(1..10) >= 8
            true
        else  
            false        
        end
    end
end
