# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update show destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.user = User.first
    @article.save
    if @article.save
      flash[:notice] = 'Article was sucessfully created'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = set_article
  end

  def edit
    @article = set_article
  end

  def update
    @article = set_article
    if @article.update(article_params)
      flash[:notice] = 'Article was updated'
      redirect_to article_path(@article)
    else
      flash[:notice] = 'Article was not updated'
      render 'edit'
    end
  end

  def destroy
    @article = set_article
    @article.destroy
    flash[:notice] = 'Article was successfully deleted ! '
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
