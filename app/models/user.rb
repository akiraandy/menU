class User < ApplicationRecord
  has_many :orders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def completed_orders
    self.orders.where(status: true).order(:updated_at)
  end
end
