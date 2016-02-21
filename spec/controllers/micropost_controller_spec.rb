require 'rails_helper'

describe MicropostsController do 

	describe 'GET #index' do 
			it "populates an array of all microposts" do
		 end # finishes describe 'GET #index'
	end
	
	describe 'GET #show' do 
		it "assigns the requested contact to @contact" do 
			micropost = create(:micropost)
			get :show, id: micropost
			expect(response).to render_template :show
		end 
	end	

	describe 'GET #new' do 
		it "assigns a new Micropost to @user"
		it "renders the :new template"
	end 

	describe "GET #edit" do 
		it "assigns the requested Micropost to @contact"
		it "renders the :edit template"
	end 

	describe "POST #create" do 
		context "with valid attribuetes" do 
			it "saves the new Micropost in the database"
			it "redirects to micropost#show"
		end 

		context "with invalid attributes" do 
			it "does not save the new Micropost in the database"
			it "re-renders the :new template"
		end 
	end 

	describe 'PATCH #update' do 
		context "with valid attributes" do 
			it "updates the Micropost in the database"
			it "redirects to the contact"
		end 

		context "with invalid attributes" do
			it "does not update the Micropost"
			it "re-renders the :edit template"
		end 
	end 

	describe "DELETE #destroy" do 
		it "deletes the Micropost from the database"
		it "redirects to users#index"
	end 



end # finishes ContactsController 
