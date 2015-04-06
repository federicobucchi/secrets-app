class SecretsController < ApplicationController
  def list
  end

  def show
  end

  def new
  end

  def create
    @secret = Secret.new(secret_params)
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
