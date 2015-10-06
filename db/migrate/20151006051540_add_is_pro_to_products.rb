class AddIsProToProducts < ActiveRecord::Migration
  def change
    add_column :products, :is_pro, :boolean, default: false
  end
end
