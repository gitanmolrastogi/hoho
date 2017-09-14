class User::PassesController < ApplicationController
  def index
    @passes = Pass.where(is_active: true)
  end
  
  def new
  end

  def create
  end

  def show
  end
end
