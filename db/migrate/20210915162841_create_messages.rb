class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :sender, null: false, type: :bigint
      t.references :recipient, polymorphic: true, null: false, type: :bigint

      t.timestamps
    end
  end
end
