class HomeController < ApplicationController
  def index
    @shortened_url = params[:shortened_url_code]
  end

  def create_shortened_url
    original_url = params[:url_form][:original_url]
    shortened_code = generate_unique_shortened_code
    new_url_data = ShortenedUrl.create(original_url: original_url, shortened_code: shortened_code)

    flash[:shortened_url_code] = new_url_data.shortened_code
    redirect_to root_path
  end

  private

  def shortened_url_params
    params.require(:url_form).permit(:original_url)
  end

  def generate_unique_shortened_code
    loop do
      code = generate_shortened_code
      return code unless ShortenedUrl.exists?(shortened_code: code)
    end
  end

  def generate_shortened_code
    charset = Array('A'..'Z') + Array('a'..'z') + Array('0'..'9')
    Array.new(6) { charset.sample }.join
  end
end
