class UsersController < ApplicationController
  def show
    @reviews = current_user.reviews.order('updated_at DESC')
  end
end
