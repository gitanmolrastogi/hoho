ActiveAdmin.register Tip do
permit_params :title ,:content
filter :title
filter :content
end
