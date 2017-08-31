class Admin::DashboardController < ApplicationController
	http_basic_authenticate_with name: ENV["USER_AUTH_USERNAME"], password: ENV["USER_AUTH_PASSWORD"]
  end
end
