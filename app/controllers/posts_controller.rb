class PostsController < ApplicationController

  before_filter :authenticate_user!
  add_breadcrumb "Lista de Post", :posts_path, :only => %w(index show new edit)

  # GET /posts
  # GET /posts.json
  def index
    # @posts = Post.all
    # @posts = Post.paginate(:page => params[:page])
    # @posts = Post.paginate(:page => params[:page], :per_page => 5)

    @posts = Post.order(:created_at).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      format.pdf do
        @posts = Post.all
        pdf = PDF::Writer.new   
        pdf.text "Lista de Posts" , :font_size => 36, :justification => :center
        pdf.text " "
        @posts.each do |post|
          pdf.text "Autor: ",  :font_size => 12
          pdf.text post.user.username
          pdf.text " "
          pdf.text "Titulo: "
          pdf.text post.title
          pdf.text " "
          pdf.text "Contenido: " 
          pdf.text post.content
          pdf.text "--------------------------------------------------------------------------------------------------------------------------------------"
        end
        send_data pdf.render, :filename => 'Lista de Posts.pdf', :type => 'application/pdf', :disposition => 'inline'
        #send_data PostDrawer.draw(@posts), :filename => '#{@post.user.username}Post.pdf', :type => 'application/pdf', :disposition => 'inline'
      end
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    add_breadcrumb "Post de #{@post.user.username}"

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
      format.pdf do
        pdf = PDF::Writer.new   
        pdf.text "Post de #{@post.user.username}" , :font_size => 36, :justification => :center
        pdf.text " "
        pdf.text "Titulo: ", :font_size => 12
        pdf.text @post.title
        pdf.text " "
        pdf.text "Contenido: " 
        pdf.text @post.content

        send_data pdf.render, :filename => "Post de #{@post.user.username}", :type => 'application/pdf', :disposition => 'inline'
        #send_data PostDrawer.draw(@posts), :filename => '#{@post.user.username}Post.pdf', :type => 'application/pdf', :disposition => 'inline'
      end
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    add_breadcrumb "Nuevo post"

    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])

    add_breadcrumb "Post de #{@post.user.username}", Post.find(params[:id])
    add_breadcrumb "Editar Post"
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
