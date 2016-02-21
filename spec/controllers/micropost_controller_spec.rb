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


end # finishes ContactsController 
