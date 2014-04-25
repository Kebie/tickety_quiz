require 'spec_helper'


describe TicketsController do
  
  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET #index" do
    it "populates an array of tickets" do
      ticket = FactoryGirl.create(:ticket)
      get :index
      assigns(:tickets).should eq([ticket])
    end
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested ticket to @ticket" do
      ticket = FactoryGirl.create(:ticket)
      get :show, id: ticket
      assigns(:ticket).should eq(ticket)
    end
  end

  describe "GET #new" do
    it "assigns a new ticket to @ticket"
    it "renders the :new template" do
      response.should render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      
      it "saves the new contact in the database" do
        expect {
          post :create, ticket: FactoryGirl.attributes_for(:ticket)
        }.to change(Ticket,:count).by(1)
      end
      
    end

    context "with invalid attributes" do
      it "does not save the new contact in the database" do
        expect{
          post :create, ticket: FactoryGirl.attributes_for(:invalid_contact)
        }.to_not change(Ticket,:count)
      end
   
    end

  end

  describe 'Delete destroy' do
    before :each do
      @ticket = FactoryGirl.create(:ticket)
    end

    it "deletes the contact" do
      expect{
        delete :destroy, id: @ticket
      }.to change(Ticket,:count).by(-1)
    end

  end



end
