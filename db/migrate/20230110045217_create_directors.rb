class CreateDirectors < ActiveRecord::Migration[6.1]
  def change
    create_table :directors do |t|
      t.date :dob
      t.string :name

      t.timestamps
    end
  end
end
