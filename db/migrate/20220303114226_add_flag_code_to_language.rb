class AddFlagCodeToLanguage < ActiveRecord::Migration[6.1]
  def change
    add_column :languages, :flagcode, :string
  end
end
