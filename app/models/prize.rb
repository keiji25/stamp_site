class Prize < ApplicationRecord
    mount_uploader :image, PrizeUploader
end
