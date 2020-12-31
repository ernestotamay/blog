class ArticlesController < ApplicationController
  #ejecutar metodo :find_article antes de la acciones:
  #before_action :find_article, only: [:show, :edit, :update, :destroy, :from_author]

  #ejecutar metodo :find_article en todas las acciones, excepto:
  before_action :find_article, except: [:index,:new,:create]
  before_action :authenticate_user!, only: [:new, :create,:show,:update,:edit, :index, :destroy,:from_author]

  def index
    @articles = Article.all
  end

  def show

  end

  def edit

    @categories = Category.all

  end

  def update
    #@article.update(title: params[:article][:title],content: params[:article][:content])
    @article.update(article_params)
    @article.save_categories
    #trabaja con vista: show
    redirect_to @article
  end

  def destroy
    @article.destroy

    #listar todos los articulos en index
    redirect_to articles_path

    #redirecciona a la ruta raiz designada
    #redirect_to root_path
  end

  def new
    @article = Article.new
    @categories = Category.all

  end

  def create
    #@article = current_user.articles.create(title: params[:article][:title], content: params[:article][:content])
    @article = current_user.articles.create(article_params)


    @article.save_categories

    redirect_to @article
  end

  def from_author
    @user = User.find(params[:id])
  end


  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, category_elements: [])
  end


end
