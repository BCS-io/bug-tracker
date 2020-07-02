class PagesController < ApplicationController
  layout "guest"

  def home
    authorize :pages
  end
end
