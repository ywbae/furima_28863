class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :item
      t.references :user
      t.references :nickname 
      t.text :comment_text
      t.timestamps
    end
  end
end