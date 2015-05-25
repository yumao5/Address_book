class AdminUser < ActiveRecord::Base

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates :first_name, :presence => true,
                         :length => { :maximum => 25 }
  validates :last_name, :presence => true,
                        :length => { :maximum => 50 }
  validates :username, :length => { :maximum => 50 }
  validates :email, :presence => true,
                    :length => { :maximum => 100 },
                    :format => EMAIL_REGEX
  validates :phone, :length => { :maximum => 20 }
  # validates :createby, :length => { :maximum => 55 }

  scope :sorted, lambda { order("last_name ASC, first_name ASC") }

  def name
    "#{first_name} #{last_name}"
  end

  private

end
