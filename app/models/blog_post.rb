class BlogPost < ActiveRecord::Base
  validates :title, presence: true
  has_and_belongs_to_many :legal_cases
end