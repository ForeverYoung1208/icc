class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
#         :recoverable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :sections
  has_many :user_sections, :dependent => :destroy
  has_many :sections, :through => :user_sections
  # attr_accessible :title, :body

#  i've left that idea
#
#  def soft_delete
#    # assuming you have deleted_at column added already
#    update_attribute(:deleted_at, Time.current)
#  end

  def redactor?( section )
    raise 'no section given' if section.nil?
    self.sections.include?( section )
  end

  def admin?
    #take all uniq sections
    all_sections=Section.all.to_a.uniq

    #subtract from all uniq sections wtih current user's sections
    all_sections - self.sections == []

    #he is admin if all existing sections removed by current user's sections
  end

end
