class Project < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.ios
    where(subtitle: 'iOS App')
  end

  scope :ruby_on_rails, -> {where(subtitle: 'Ruby on Rails')}
end
