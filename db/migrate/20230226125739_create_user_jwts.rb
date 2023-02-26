class CreateUserJwts < ActiveRecord::Migration[7.0]
  def change
    create_table :user_jwts do |t|

      t.timestamps
    end
  end
end
