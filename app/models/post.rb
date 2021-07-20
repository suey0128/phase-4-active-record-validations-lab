class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250} #250
    validates :summary, length: {maximum: 250} #250
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

    validate :title_need_to_contain_certian_words

    def title_need_to_contain_certian_words
        # unless ["Won't Believe", "Secret", "Top", "Guess"].any? { |clickbate| title.include? clickbate }
        unless title.present? && title.include?("Won't Believe")  #||  title.include?"Secret"  || title.include?"Top" || title.include?"Guess"
            errors.add(:title, "not valid")
        end
        # puts title.class
    end

end

# p1 = Post.create(title: "Won't Believe yes", content:"Won't Believe yes content", summary: "Won't Believe yes summary", category: "Fiction")
# Post.create(title: "yes", content:"yes content", summary: "yes summary", category: "Fiction")
