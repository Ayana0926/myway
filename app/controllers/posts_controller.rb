def index
    @posts= Post.all
    @tags = Tag.all
    @posts = @posts.where("body LIKE ? ",'%' + params[:search] + '%') if params[:search].present?

  end