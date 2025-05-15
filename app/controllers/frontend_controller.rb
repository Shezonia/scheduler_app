class FrontendController < ApplicationController
  def index
    render file: "#{Rails.root}/public/Frontend/index.html", layout: false
  end
end
