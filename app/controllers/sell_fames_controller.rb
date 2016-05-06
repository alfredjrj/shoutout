class SellFamesController < ApplicationController
   
   def profile
      @user =    User.friendly.find(params[:id])
      
   end 
end
