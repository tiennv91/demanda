class CreateTranslations < ActiveRecord::Migration[6.0]
  def change
    create_table :translations do |t|
      t.integer :translatable_id
      t.string :translatable_type
      t.string :language, limit: 6
      t.string :title
      t.text :description
      t.timestamps
    end

    add_index :translations, [:translatable_id, :translatable_type]
    add_index :translations, [:translatable_id, :translatable_type, :language], name: 'translation_and_language'
  end
end