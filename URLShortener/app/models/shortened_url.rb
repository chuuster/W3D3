class ShortenedUrl < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true
  validates :user_id, presence: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  def self.random_code
    url = SecureRandom.urlsafe_base64
    while exists?(url)
      url = SecureRandom.urlsafe_base64
    end
    url
  end

  def self.create_url(user, long_url)
    ShortenedUrl.create!(short_url: "coolurls.co/#{ShortenedUrl.random_code}", long_url: long_url, user_id: user.id)
  end


end
