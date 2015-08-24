module ControllerMacros
  def is_authorized
    before(:each) do
      allow(controller).to receive(:authorize!).and_return(true)
    end
  end

  def is_unauthorized
    before(:each) do
      allow(controller).to receive(:authorize!).and_raise(CanCan::AccessDenied)
    end
  end
end
