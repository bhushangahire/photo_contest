class ContestantEntry < ActiveRecord::Base
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  belongs_to :contestant
  
end

# == Schema Information
#
# Table name: contestant_entries
#
#  id                 :integer         not null, primary key
#  contestant_id      :integer
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :string(255)
#  photo_update_at    :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

