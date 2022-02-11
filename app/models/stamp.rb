class Stamp < ApplicationRecord
    mount_uploader :image, StampUploader
end
