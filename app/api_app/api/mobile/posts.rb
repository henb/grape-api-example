module API::Mobile
  class Posts < Grape::API
    namespace :posts do
      desc 'Return all posts'
      get do
        response 200, posts: Post.all
      end

      params { requires :id, type: Integer, desc: "Uniq ID for post" }
      route_param :id do
        desc 'Return post'
        get do
          response 200, posts: Post.find(params[:id])
        end
      end
    end
  end
end
