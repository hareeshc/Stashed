class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      #t.integer :status_id
      t.references :status
      t.belongs_to :service
      t.string :message

      t.timestamps
    end
  end
end
