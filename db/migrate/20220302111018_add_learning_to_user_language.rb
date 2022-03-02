class AddLearningToUserLanguage < ActiveRecord::Migration[6.1]
  def change
    add_column :user_languages, :learning, :boolean, default: false
  end
end
