class BlogPostsController < ApplicationController
  def blog_post_params
    params.require(:blog_post).permit(:name, :tag_list)
  end
end
