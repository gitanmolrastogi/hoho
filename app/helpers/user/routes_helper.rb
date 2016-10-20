module User::RoutesHelper
	def duration route_detail
		route_detail.line_color_routes.first.duration.to_i/7
	end

end
