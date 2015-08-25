class AddPostToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :post_id, :integer
    add_index :votes, :post_id
  end
end
