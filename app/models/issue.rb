class Issue < ActiveRecord::Base
  has_and_belongs_to_many :blog_posts
  has_ancestry

  alias_attribute :title, :name

  alias_method :related_content, :blog_posts


  # quick slugging

  def self.find(slug)
    if slug.is_a?(Array)
      where(id: slug).to_a
    else
      where("LOWER(name) = ?", slug.downcase.gsub('-', ' ')).take!
    end
  end

  def to_param
    title.downcase.sub(/\s/, '-')
  end
end
