class CreateSignIns < ActiveRecord::Migration[6.0]
  def change
    create_table :sign_ins do |t|
      t.references :user
      t.references :email
      t.references :password
      t.timestamps
    end
  end
end
