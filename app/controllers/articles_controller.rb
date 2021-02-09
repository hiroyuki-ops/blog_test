class ArticlesController < ApplicationController
  before_action :find_post, only: (:show :edit :update :destroy)
  def index
  	@posts = Post.order(created_at: :desc)
  end

  def show
  	@post = Post.find(params[:id])
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
  	
  end
end
