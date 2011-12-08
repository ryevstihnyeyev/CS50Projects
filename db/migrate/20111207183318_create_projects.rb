class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :title
      t.string :author
      t.string :author_email
      t.text :contents

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
