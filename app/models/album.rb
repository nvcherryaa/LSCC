class Album < ActiveRecord::Base

  belongs_to :artist
  has_many  :songs

  validates :name, presence: true
  validates :artist_id, presence: true

  has_attached_file :avatar, styles: { medium: "400x400>", thumb: "200x200>" }, default_url: "/images/no_album.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end
