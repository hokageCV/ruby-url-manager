class HomeController < ApplicationController
  def index
    @shortened_url = params[:shortened_url_code]
  end

  def create_shortened_url
    original_url = params[:url_form][:original_url]

    if WebUrl.valid?(original_url)
      shortened_code = UidGenerator.generate_unique_code
      new_url_data = ShortenedUrl.create(original_url: original_url, shortened_code: shortened_code)

      flash[:shortened_url_code] = new_url_data.shortened_code
    else
      flash[:error] = "Invalid URL"
    end

    redirect_to root_path
  end

  private

  def shortened_url_params
    params.require(:url_form).permit(:original_url)
  end
end
