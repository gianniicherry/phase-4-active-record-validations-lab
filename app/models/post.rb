class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :sufficiently_clickbait_y

  private

  def sufficiently_clickbait_y
    unless title.present? &&
           (title.include?("Won't Believe") ||
            title.include?("Secret") ||
            title.match?(/\bTop \d+\b/) ||
            title.include?("Guess"))
    end
end
end
