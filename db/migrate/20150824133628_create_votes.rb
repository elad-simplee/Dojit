class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      belongs_to :post
      belongs_to :user

      t.timestamps null: false
    end
  end
end
