class CreateCommands < ActiveRecord::Migration[7.1]
  def change
    create_table :commands, id: :uuid do |t|
      t.string :tech
      t.string :command
      t.string :flag
      t.string :flag_long
      t.string :flag_short
      t.string :description
      t.string :result
      t.string :usage

      t.timestamps
    end
  end
end
