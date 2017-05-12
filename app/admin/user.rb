ActiveAdmin.register User do
filter :email_cont,as: :string,label: 'Email'
filter :first_name_cont,as: :string,label: 'First Name'
filter :last_name_cont,as: :string,label: 'Last Name'
actions :all, :except => [:new,:destroy,:edit]
	index :download_links => false do
		column :first_name,:sortable => false
		column :last_name,:sortable => false
		column :email,:sortable => false
		column 'Status' do |user|
			if !(user.is_block == true)
				'<i class = "status_tag yes"> Unblock </i>'.html_safe
			else
				'<i class = "status_tag no"> Block </i>'.html_safe
			end
		end
		column 'Actions' do |resource|
			a do 
				if !(resource.is_block == true)
					link_to 'Block' ,block_user_admin_users_path(id: resource.id)
				else
					link_to 'Unblock' ,block_user_admin_users_path(id: resource.id)
				end
			end
		end
	end
	#action for block/unblock user by admin
	collection_action :block_user, method: :get do
		user = User.find(params[:id]) 
		if (user.is_block == true)
			user.update_attributes(:is_block => false)
			redirect_to  admin_users_path
		else
			user.update_attributes(:is_block => true)
			redirect_to  admin_users_path
		end
	end
end

