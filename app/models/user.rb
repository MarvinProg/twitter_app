class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 50}
  # Пример из книги. Но не очень хорошее регулярное выражение. Использую стандартный. Замарачиваться не стоит с регуляркой.
  validates :email, presence: true, length: {maximum: 255}, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }
end
