class ProductsController < RankingController
  before_action :authenticate_user!, only: :search

  def index
    @products = Product.order("id ASC").limit(20)
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    # @products = Product.where('title LIKE(?)', "%#{params[:keyword]}%").limit(20)
    keyword = "%#{params[:keyword]}%"
    @products = Product.find_by_sql(["select * from products where title like ? LIMIT 20", keyword]) #バインド機構を使用している、?はプレースホルダー
  end
end
