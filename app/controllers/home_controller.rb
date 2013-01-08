class HomeController < ApplicationController
  protect_from_forgery
  def index

    
    time=2.hours.ago
    start_time=Time.parse("#{time.year}-#{time.month}-#{time.day} #{time.hour}:00")
   
    data=DataChunk.where(:start_at => start_time).first

    while data==nil
      start_time=start_time-1.hour
      data=DataChunk.where(:start_at => start_time).first
    end
   
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
