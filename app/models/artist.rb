class Artist < ActiveRecord::Base

  has_many :albums

  validates :name, presence: true

  has_attached_file :avatar, styles: { medium: "400x400>", thumb: "200x200>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


end
