class ShortenedUrl < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true
  validates :user_id, presence: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Visit

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

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visits.select(:user_id).map { |v| v.user_id }.uniq.count
  end

  def num_recent_uniques
    self.visits.select(:user_id).where("created_at - NOW() < make_interval(mins := 10)").map { |v| v.user_id }.uniq.count
  end

  def self.[](index)
    ShortenedUrl.all[index]
  end

end
