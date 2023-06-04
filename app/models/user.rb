class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  # Пример из книги. Но не очень хорошее регулярное выражение. Использую стандартный. Замарачиваться не стоит с регуляркой.
  validates :email, presence: true, length: {maximum: 255}, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  before_save :email_in_downcase

  # для руби 3.2.1 и более нужен гем gem 'bcrypt-ruby', '~> 3.1.2'
  has_secure_password

  def email_in_downcase
    self.email = email.downcase
  end
end
