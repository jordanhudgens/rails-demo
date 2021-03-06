class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  access all: [:index], user: { except: [:destroy, :new, :create, :update, :edit] }, editor: { except: [:destroy] }, super_admin: :all

  # GET /articles
  # GET /articles.json
  def index
    if !current_user
      @categories = Category.preview_mode
    else
      @categories = Category.with_articles
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    if current_user == @article.user || current_user.roles.include?(:super_admin)
      respond_to do |format|
        if @article.update(article_params)
          format.html { redirect_to @article, notice: 'Article was successfully updated.' }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path, notice: "You don't have permission to update this record"
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    if current_user == @article.user || current_user.roles.include?(:super_admin)
      @article.destroy
      respond_to do |format|
        format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path, notice: "You don't have permission to delete this record"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(
        :title,
        :content,
        :category_id
      )
    end
end
