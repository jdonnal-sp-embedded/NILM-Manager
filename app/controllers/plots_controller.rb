class PlotsController < ApplicationController
  layout nil
  respond_to :html, :json, :xml

  def destroy
    
  end
  def create
    
  end
  def new
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
  def index
    
    
    start_time=Time.parse("#{params[:year]}-#{params[:month]}-#{params[:date]} #{params[:hour]}:00")
   
    data=DataChunk.where(:start_at => start_time).first
   
    unless data
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
    @plot_data["date"]=data.start_at.in_time_zone.strftime("%D")
    @plot_data["phase"]=params[:phase]
    @plot_data["image_url"]=data.basename+image_ext
    
  end
end