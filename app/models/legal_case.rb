class LegalCase < ActiveRecord::Base
  has_and_belongs_to_many :blog_posts

end
