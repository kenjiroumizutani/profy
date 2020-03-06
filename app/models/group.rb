class Group < ApplicationRecord
  
  #association
  has_many :users
  # 一つのgroupは複数のuserを持つ
  has_many :questions, ->{ order("created_at DESC") }
  
end
