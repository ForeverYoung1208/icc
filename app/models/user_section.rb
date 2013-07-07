class UserSection < ActiveRecord::Base
  belongs_to :user
  belongs_to :section

  attr_accessible :user, :section
end
