class AddAdminUser < ActiveRecord::Migration[7.2]
  def change
    AdminUser.create!(
      email: "rohitsen@gmail.com",
      password: "12345678", 
      password_confirmation: "12345678"
    )
  end
end
