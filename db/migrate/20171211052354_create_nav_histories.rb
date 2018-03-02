class CreateNavHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :nav_histories do |t|
      t.integer :scheme_code
      t.string :scheme_name
      t.float :nav
      t.float :repurchase_price
      t.float :sale_price
      t.date :date
    end
  end
end
