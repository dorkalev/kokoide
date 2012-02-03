class MainController < ApplicationController
  
  def index
  	if params[:dir].present?
  	  @dir = params[:dir]
    else
      raise 'wow'
    end
    # @dir = "/Users/dor/src/tikalk/course/korbanot/"
    # @content = File.read("#{@dir}app/controllers/main_controller.rb")
  end
  
end
