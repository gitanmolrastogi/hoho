ActiveAdmin.register Activity do

filter :neme
filter :overview
filter :information

permit_params :name ,:overview ,:price , :image ,:information , :start_date ,:end_date , :start_time , :end_time  ,:city_id, :category_id , photos_attributes: [:id, :image , :_destroy]


end
