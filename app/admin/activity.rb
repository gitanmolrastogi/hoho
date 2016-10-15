ActiveAdmin.register Activity do

filter :neme
filter :overview
filter :information


permit_params :name ,:overview ,:information ,:city_id, :category_id


end
