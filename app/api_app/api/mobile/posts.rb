module API::Mobile
  class Posts < Grape::API
    namespace :posts do
      desc 'Return all posts'
      get do
        response 200, posts: Post.all
      end
    end
  end
end
