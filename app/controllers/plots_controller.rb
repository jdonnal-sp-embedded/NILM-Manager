class PlotsController < ApplicationController
  layout nil
  def destroy
    
  end
  def create
    
  end
  def new
    
  end
  def index
    start_time=Time.parse("#{params[:year]}-#{params[:month]}-#{params[:date]} #{params[:hour]}:00")
   
    data=DataChunk.where(:start_at => start_time).first
    puts "####"
    puts data
    puts "###"
    unless data
      render :text=>"no data"
      return
    end
    image_ext='error'
    case params[:phase]
    when '1'
      image_ext='.prep1.png'
    when '2'
      image_ext='.prep2.png'
    when '3'
      image_ext='.prep3.png'
    else
      image_ext='illegal phase'
    end
    
    @plot_data=Hash.new()
    @plot_data["date"]=data.start_at.strftime("%D")
    @plot_data["phase"]=params[:phase]
    @plot_data["image_url"]=data.archive+image_ext
    @plot_data["phase"]+@plot_data["date"]
    @plot_data["start_time"]=data.start_at.strftime("%H:%M")
    @plot_data["end_time"]=data.end_at.strftime("%H:%M")
  end
end