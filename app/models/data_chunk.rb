class DataChunk
  include Mongoid::Document
  
  field :start_at, type: DateTime
  field :end_at, type: DateTime
  field :comment, type: String
  field :phase1_image_url, type: String
  field :phase2_image_url, type: String
  field :phase3_image_url, type: String
  field :phase1_prep_data, type: String
  field :phase2_prep_data, type: String
  field :phase3_prep_data, type: String
  field :raw_data, type: String
  field :phase1_csv_data, type: String
  field :phase2_csv_data, type: String
  field :phase3_csv_data, type: String


end
