class CreateOptions < ActiveRecord::Migration[7.1]
  def change
    create_table :options, id: :uuid do |t|
      t.string :long
      t.string :type
      t.integer :level
      t.string :usage
      t.uuid :command_id, null: false, index: true

      t.timestamps
    end
    add_foreign_key :options, :commands, column: :command_id
  end
end