class ShortenedUrlsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def redirect_to_original
        shortened_url_data = ShortenedUrl.find_by(shortened_code: params[:short_code])
        
        if shortened_url_data
          redirect_to shortened_url_data.original_url, allow_other_host: true
        else
          redirect_to not_found_path
        end
    end

    def user_urls
      @user_urls = current_user.shortened_urls
    end

    def destroy
      url = current_user.shortened_urls.find(params[:id])
      url.destroy
      redirect_to user_urls_path, notice: 'URL deleted successfully.'
    end
end
