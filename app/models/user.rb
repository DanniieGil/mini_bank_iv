class User < ApplicationRecord
  validates :identification, presence: true, uniqueness: true
  validates :names, presence: true

  def show_information
    "#{self.class.name}: #{names}, ID: #{identification}"
  end
end
