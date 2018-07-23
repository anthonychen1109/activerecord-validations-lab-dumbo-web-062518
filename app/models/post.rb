class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :clickbait

  private

  def clickbait
    array = ["Won't Believe", "Secret", "Top", "Guess"]
    counter = 0
    array.each do |word|
      binding.pry
      if self.title.to_s.include?(word)
        counter +=1
      end
    end
    if counter == 0
      return errors.add(:title, "must be clickbait")
    end
  end

end
