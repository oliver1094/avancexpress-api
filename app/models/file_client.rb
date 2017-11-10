class FileClient < ApplicationRecord
  belongs_to :client
  mount_uploader :name, FileClientUploader
end
