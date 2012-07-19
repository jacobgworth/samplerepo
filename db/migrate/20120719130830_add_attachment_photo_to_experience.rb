class AddAttachmentPhotoToExperience < ActiveRecord::Migration
  def self.up
    change_table :experiences do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :experiences, :photo
  end
end
