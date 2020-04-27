class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :require_login, except: [:index, :show]
    def index
        @articles = Article.all
    end
    def show
      @article = Article.find(params[:id])
      @comment = Comment.new
      @comment.article_id = @article.id

    end
    def new
      @article = Article.new
    end
    def create
      @article = Article.new(
        title: params[:article][:title],
        body: params[:article][:body])
      @article.save
      redirect_to article_path(@article)
    end
    def destroy
        @article = Article.find(params[:id])

        flash.notice = "El artículo \"#{@article.title}\" fue eliminado!"

        @article.destroy

        redirect_to articles_path()
    end
    def edit
      @article = Article.find(params[:id])
    end
    def update
      @article = Article.find(params[:id])
      @article.update(article_params)
    
      flash.notice = "Article '#{@article.title}' Updated!"
    
      redirect_to article_path(@article)
    end
    
    
end
