class AddIntroductionToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :introduction, :text
  end
end
