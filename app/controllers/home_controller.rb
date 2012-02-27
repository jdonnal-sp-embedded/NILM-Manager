class HomeController < ApplicationController
  protect_from_forgery
  def index

    
    start_time=Time.parse("#{Time.now.year}-#{Time.now.month}-#{Time.now.day} #{Time.now.hour-2}:00")
   
    data=DataChunk.where(:start_at => start_time).first
   
    unless data
      render :text=>"no data"
      return
    end
    @plot_data=Hash.new()
    @plot_data["date"]=data.start_at.in_time_zone.strftime("%D")
    @plot_data["phase"]='1'
    @plot_data["image_url"]=data.basename+'.prep1.png'
  end
end
