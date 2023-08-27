class HomeController < ApplicationController
  def index
    @shortened_url_code = flash[:shortened_url_code] if flash[:shortened_url_code]
    @shortened_url_data = ShortenedUrl.find_by(shortened_code: flash[:shortened_url_code])
    @original_url = @shortened_url_data.original_url if @shortened_url_data
  end

  def create_shortened_url
    original_url = params[:url_form][:original_url]

    if WebUrl.valid?(original_url)
      shortened_code = UidGenerator.generate_unique_code
      expires_at = user_signed_in? ? nil : 1.hour.from_now
      user_id = user_signed_in? ? current_user.id : nil
    
      new_url_data = ShortenedUrl.create(original_url: original_url, shortened_code: shortened_code, expires_at: expires_at, user_id: user_id)

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
