class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  require 'csv' # 追記
end
