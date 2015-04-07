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
        @secret[0].active = false
        @secret[0].save
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
    if @secret.save
      redirect_to pages_home_path
    else
      render :action => "new"
    end
  end

  private
    def secret_params
      params.require(:secret).permit(:title, :text)
    end
end
