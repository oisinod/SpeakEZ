class CreateUserLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :user_languages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true
      t.integer :skill_level
      t.boolean :validated, default: false

      t.timestamps
    end
  end
end
