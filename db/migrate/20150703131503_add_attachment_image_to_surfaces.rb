class AddAttachmentImageToSurfaces < ActiveRecord::Migration
  def self.up
    change_table :surfaces do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :surfaces, :image
  end
end
