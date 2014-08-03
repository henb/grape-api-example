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

      desc 'Create post'
      params do
        requires :title, type: String, desc: 'Post title'
        requires :description, type: String, desc: 'Post description'
      end
      post do
        post = Post.new(title: params[:title], description: params[:description])

        response 400, error_message: post.errors.to_a.join(', ').downcase unless post.save
        response 201, message: 'Post created!', post_id: post.id
      end

      params { requires :id, type: Integer, desc: 'Uniq ID for post' }
      route_param :id do

        desc 'Return post'
        get do
          set_post
          response 200, post: post
        end

        desc 'Delete post'
        post :destroy do
          set_post.destroy
          response 201, message: 'Post deleted!'
        end

      end
    end
  end
end
