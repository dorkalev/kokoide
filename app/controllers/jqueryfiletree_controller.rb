class JqueryfiletreeController < ApplicationController
  layout :false
  protect_from_forgery :only => []

  def content
    @parent = params[:dir]
    @dir = Jqueryfiletree.new("#{@parent}").get_content
  end
end