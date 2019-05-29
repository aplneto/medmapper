module ControllerMacros
    # before(:each) do
    #     @request.env["devise.mapping"] = Devise.mappings[:admin]
    #     sign_in FactoryBot.create(:admin) # Using factory bot as an example
    #     def login_admin
    #   end
    # end
  
    def login_account
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:account]
        @account = FactoryBot.create(:account)
        sign_in @account
      end
    end
  end