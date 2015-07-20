class BaughleonWebsite < Sinatra::Base

  # root route
  get "/" do
    redirect("/home")
  end

  # home page
  get "/home" do
    erb(:home)
  end

  # music page
  get "/music" do
    erb(:music)
  end

  # index
  get "/blogposts" do
    @blogposts = Blogpost.all
    erb(:"blogposts/index")
  end

  # new
  get "/blogposts/new" do
    @blogpost = Blogpost.new
    erb(:"blogposts/new")
  end

  # create
  post "/blogposts" do
    @blogpost = Blogpost.new(params[:blogpost])
      if @blogpost.save
        redirect("/blogposts/#{@blogpost.id}")
      else
        erb(:"blogposts/new")
      end
   end

  # show
  get '/blogposts/:id' do
    @blogpost = Blogpost.find(params[:id])
    erb(:"blogposts/show")
  end

  # edit
  get '/blogposts/:id/edit' do
    @blogpost = Blogpost.find(params[:id])
    erb(:"blogposts/edit")
  end

    # update
    put '/blogposts/:id' do
    @blogpost = Blogpost.find(params[:id])
    if @blogpost.update_attributes(params[:blogpost])
      redirect("/blogposts")
    else
      erb(:"blogposts/new")
    end
  end

    # destroy
    delete '/blogposts/:id' do
    @blogpost = Blogpost.find(params[:id])
      if @blogpost.destroy
        redirect("/blogposts")
      else
        redirect("/blogposts/#{@blogpost.id}")
      end
    end

end
