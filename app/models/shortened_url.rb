class ShortenedUrl < ActiveRecord::Base
  validates :long_url, :short_url, presence: true, uniqueness: true

  def self.random_code
    loop do
      return random_code = SecureRandom.urlsafe_base64(16) unless self.exists?(short_url: random_code)
    end
  end

  def self.create_for_user_and_long_url!(user, long_url)
    self.create!(long_url: long_url, short_url: random_code, user_id: user.id)
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    self.visits.where("visits.updated_at > ? ", 30.minutes.ago).distinct.count
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  has_many :visits,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: 'Visit'

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :user

end
