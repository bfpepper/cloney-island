class AddAttachmentBannerImageToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :banner_image
    end
  end

  def self.down
    remove_attachment :projects, :banner_image
  end
end
