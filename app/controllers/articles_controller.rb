class ArticlesController < ApplicationController
	#before_action :validate_user, except: [:show,:index] 
	before_action :authenticate_user!, except: [:show,:index] 
	before_action :set_article, except: [:index,:new,:create]
	#GET /articles
	def index
		@articles = Article.all
	end

	#GET /articles/:id
	def show
		#@article = Article.find(params[:id])
		@article.update_visits_count
		@comment = Comment.new
	end

	#GET /articles/new
	def new
		@article = Article.new #creo un nuevo articulo , pero aun no esta en la db
	end

	#POST /articles
	def create
		@article = current_user.articles.new(article_params)
#o tambien :
#@article = current_user.articles.new(title: params[:article][:title],body: params[:article][:body])

		if @article.save #Para que se guarde en la db
			redirect_to @article #redirije al articulo en cuestion
		else
			render :new
		end
	end

	def destroy
		#@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	def edit
		#@article = Article.find(params[:id])

	end

	#PUT /articles/:id
	def update

		#@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end
	end

	private 

	def set_article
		@article = Article.find(params[:id])
	end

	def validate_user
		unless user_signed_in?
			redirect_to new_user_session_path, notice: "Necesitas Iniciar sesion"
		end
	end

	def article_params
		params.require(:article).permit(:title,:body,:cover)
	end


end