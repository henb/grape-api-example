module API::Mobile
  class Posts < Grape::API
    helpers do
      attr_accessor :post

      def set_post
        @post = Post.find(params[:id])
      end
    end

    namespace :posts do
      desc 'Return all posts'
      get do
        response 200, posts: Post.all
      end

      desc 'create post'
      post do
        post = Post.new title: params[:title], description: params[:description]

        response error_message: post.errors.to_a.join(', ').downcase unless post.save
        response 201, message: 'Post created!'
      end
g
      params { requires :id, type: Integer, desc: 'Uniq ID for post' }
      route_param :id do

        desc 'Return post'
        get do
          set_post
          response 200, post: post
        end
        post :destroy do
          set_post.destroy
          response 201, message: 'Post deleted!'
        end

      end
    end
  end
end
