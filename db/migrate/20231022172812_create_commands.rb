class CreateCommands < ActiveRecord::Migration[7.1]
  def change
    create_table :commands, id: :uuid do |t|
      t.string :tech
      t.string :command
      t.string :usage
      t.integer :level
      t.uuid :parent_id, index: true, null: true

      t.timestamps
    end
    add_foreign_key :commands, :commands, column: :parent_id
  end
end