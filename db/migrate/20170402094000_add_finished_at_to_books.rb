class AddFinishedAtToBooks < ActiveRecord::Migration
  def change
    add_column :books, :finished_at, :dattime
  end
end
