class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :name
      t.string :text
      t.string :image
      t.references :user, foreigjn_key: true
      t.timestamps
    end
  end
end
