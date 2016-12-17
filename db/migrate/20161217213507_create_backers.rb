class CreateBackers < ActiveRecord::Migration[5.0]
  def change
    create_table :backers do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.integer :amount_given

      t.timestamps
    end
  end
end
