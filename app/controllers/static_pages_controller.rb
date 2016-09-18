class StaticPagesController < ApplicationController
  def discover
    @users =  User.all 
  end

  def welcome
  end
end
