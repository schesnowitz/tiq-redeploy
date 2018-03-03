class AppVariable < ApplicationRecord
  mount_uploader :app_logo, AppVariableImageUploader 
end
