class Section < ActiveRecord::Base
  belongs_to :user
  has_many :servises
  attr_accessible :name
end
