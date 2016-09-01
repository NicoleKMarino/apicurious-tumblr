class TumblrService

  def initialize(current_user)
      @current_user = current_user
      @current_client = current_client
      @connection = @current_client.connection
      @connection.params["api_key"] = ENV["consumer_key"]
  end

  def current_client
    @client = Tumblr::Client.new(
         :consumer_key => ENV["consumer_key"],
         :consumer_secret => ENV["consumer_secret"],
         :oauth_token => @current_user.oauth_token,
         :oauth_token_secret => @current_user.oauth_token_secret
       )
  end


  def get_user
    connection = Faraday.new("http://api.tumblr.com/")
    connection.params["api_key"] = "bpwo4TY78yxGrwDHiAYf1CMmuEYoLofUUN5KcH1066z02xfldG"
    response = connection.get "/v2/blog/#{@current_user.name}.tumblr.com/info"
    parse(response.body)
  end

  def get_followers
    response = current_client.followers("#{@current_user.name}.tumblr.com")
  end

  def reblog(id, key)
    response = current_client.reblog(@current_user.name, {id: id, reblog_key: key})
  end

  def like_post(id, key)
    response = current_client.like(id,key)
  end

  def get_likes
    connection = Faraday.new("http://api.tumblr.com/")
    connection.params["api_key"] = "bpwo4TY78yxGrwDHiAYf1CMmuEYoLofUUN5KcH1066z02xfldG"
    response = connection.get "/v2/blog/#{@current_user.name}.tumblr.com/likes"
    parse(response.body)
  end

  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end

end
