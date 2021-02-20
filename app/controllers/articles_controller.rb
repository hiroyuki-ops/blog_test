class ArticlesController < ApplicationController
  before_action :authenticate_user
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
  	@articles = Article.order(created_at: :desc)
  end

  def show
  	@article = Article.find(params[:id])
  end

  def edit
  end

  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new(article_params)
  	if @article.save
  		redirect_to @article, notice: '作成に成功しました。'
  	else
  		render :new, alert: '作成できませんでした。'
  	end
  end

  def update
  	if @article.update(artilce_params)
  		redirect_to @artilce, notice: '更新に成功しました。'
  	else
  		render :edit, alert: '更新できませんでした。'
  	end
  end

  def destroy
  	if @article.destroy
  		redirect_to root_path, notice: '削除に成功しました。'
  	else
  		redirect_to root_path, alert: '削除できませんでした。'
  	end
  end

  private
  def find_post
  	@post = Post.find(params[:id])
  end

  def artilce_params
  	params.repuire(:article).permit(:title, :body)
  end
end
