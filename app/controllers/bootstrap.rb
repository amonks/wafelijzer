Wafelijzer::App.controllers :bootstrap do
	
	get :index, :map => '/bootstrap' do
		if (settingValue 'bootstrapped')
			@alert = "already bootstrapped :("
			@alert_type = "danger"
		else
			account = Account.create(:email => "admin@example.com", :password => 'password', :password_confirmation => 'password', :role => "admin")
			if account && account.valid?
			    bootstrapped = Setting.create(:title => "bootstrapped", :body => "true")
			    @alert = "bootstrap successful! username: 'admin@example.com' password => 'password'"
			    @alert_type = "success"
			else
				@alert = "can't create account :("
				@alert_type = "danger"
			end
		end
		render 'index'
	end
 
end
