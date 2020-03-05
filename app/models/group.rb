class Group < ApplicationRecord
  
  #association
  has_many :users
  # 一つのgroupは複数のuserを持つ
end
