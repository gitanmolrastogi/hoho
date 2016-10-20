ActiveAdmin.register Activity do

filter :name
filter :overview
filter :information
permit_params :start_date ,:end_date ,:start_time,:end_time ,:price,:name ,:overview ,:information ,:city_id, :category_id

index do |f|
     selectable_column
     

     column :name
     column :overview
     column :information
     column :start_date
     column :end_date
     column :start_time do |time|
         time.try(:start_time).strftime("%H:%M")
     end
    column :end_time do |time|
         time.try(:end_time).strftime("%H:%M")
    end
    column :price
    actions
  end




 form do |f|
  f.inputs do
  	f.input :city ,:as => :select, :collection => City.all.map{|u| ["#{u.name}", u.id]}
    f.input :category ,:as => :select, :collection => Category.all.map{|u| ["#{u.name}", u.id]}
  	f.input :name
  	f.input :overview
  	f.input :information
    f.input :start_date,as: :datepicker
    f.input :end_date,as: :datepicker
    f.input :start_time
    f.input :end_time 
    f.input :price 
   
  end
  actions
end

end
