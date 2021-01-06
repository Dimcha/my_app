class Person < ActiveRecord::Base
  self.table_name = 'people'

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, format: { with: /\A\+\d+\z/ }
end
