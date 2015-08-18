module ControllerMacros
  def login_student
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:student]
      sign_in FactoryGirl.create(:student) # Using factory girl as an example
    end
  end

  def login_principal
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:principal]
      sign_in FactoryGirl.create(:principal) # Using factory girl as an example
    end
  end

  def login_teacher
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:teacher]
      sign_in FactoryGirl.create(:teacher) # Using factory girl as an example
    end
  end
end
