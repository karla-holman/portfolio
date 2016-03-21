class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string :name
    	t.text :description
    	t.string :type
      t.timestamps null: false
    end

    create_table :project_images do |t|
    	t.string :name
    	t.text :description
      t.timestamps null: false
    end

    add_attachment :projects, :header
    add_attachment :projects, :thumb
    add_attachment :project_images, :attachment
  end
end
