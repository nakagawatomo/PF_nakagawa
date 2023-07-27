class CreateMenuComments < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :menu_id

      t.timestamps
    end
  end
end
