class CreateTranslations < ActiveRecord::Migration[7.1]
  def change
    create_table :translations, id: :uuid do |t|
      t.string :locale
      t.string :key
      t.string :value
      t.uuid :translatable_id, null: false, index: true
      t.string :translatable_type, null: false, index: true

      t.timestamps
    end
    add_index :translations, [:translatable_type, :translatable_id, :key, :locale], unique: true, name: 'index_translations_on_keys_and_translatable'
  end
end