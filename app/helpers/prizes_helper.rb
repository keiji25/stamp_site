module PrizesHelper
    
    def check_image(image)
        if image.nil?
            "/images/noimage.png"
        else
            image
        end
    end

end
