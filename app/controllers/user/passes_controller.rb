class User::PassesController < ApplicationController
  def index

    @passes = Pass.all

  end
  
  def new
  end

  def create
     debugger
     dfsl.lds
  end

  def show

  end
end
