class BlogController < ApplicationController
  include ContentPermissioning
  include Tagging

  breadcrumbs "Security Education" => routes.root_path,
              "Blog" => routes.blog_path

  def index
    @blog_posts = tagged_scope.preload(:tags).
      published.order(published_at: :desc).
      page(params[:page])
  end

  def show
    @blog_post = BlogPost.friendly.find(params[:id])
    protect_unpublished! @blog_post
    breadcrumbs @blog_post.name
  end

  private

  def taggable_type
    BlogPost
  end
end
