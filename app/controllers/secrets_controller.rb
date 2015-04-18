class SecretsController < ApplicationController
  def list
    @secrets = Secret.all
  end

  def show
    token = params[:token]
    @secret = Secret.where("token = ?", token)
    if @secret.blank?
      redirect_to pages_home_path
    else
      if @secret[0].active != false
        if @secret[0].whispers > 1
          @secret[0].whispers -= 1
          @secret[0].save
        else
          @secret[0].active = false
          @secret[0].save
          redirect_to pages_home_path
        end
      else
        redirect_to pages_home_path
      end
    end
  end

  def new
  end

  def create
    @secret = Secret.new(secret_params)
    @secret.active = true
    @secret.token = (0...50).map { ('a'..'z').to_a[rand(30)] }.join
    flash[:url] = request.base_url + "/secrets/generated/" + @secret.token
    if @secret.save
      redirect_to secrets_url_path
    else
      render :action => "new"
    end
  end

  def url
    @url = flash[:url]
  end

  private
    def secret_params
      params.require(:secret).permit(:title, :text, :whispers, :time)
    end
end
