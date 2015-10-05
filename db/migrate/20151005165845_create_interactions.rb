class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.string :description
      t.references :interactive, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
