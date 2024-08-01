require 'rails_helper'

RSpec.describe "Applicants", type: :request do
  let(:user) { create(:user) } 
  let(:applicant) { create(:applicant, user: user) }
  let(:job) { create(:job) }  

  before do
    sign_in user
  end

  describe 'GET /applicants/new' do
    it 'renders new applicant form' do
      get new_applicant_path
      expect(response).to have_http_status(:ok)
    end
  end

  # describe 'GET /applicants/:id/edit' do
  #   it 'renders the edit applicant form' do
  #     get edit_applicant_path(applicant)
  #     expect(response).to have_http_status(:ok)
  #   end
  # end
  
  # describe 'PATCH /applicants/:id' do
  #   context 'with valid attributes' do
  #     it 'updates the applicant' do
  #       patch applicant_path(applicant), params: { applicant: { name: 'Updated Name' } }
  #       applicant.reload
  #       expect(applicant.name).to eq('Updated Name')
  #       expect(response).to redirect_to(root_path)
  #       expect(flash[:notice]).to eq('Applicant data was successfully updated.')
  #     end
  #   end

  #   context 'with invalid attributes' do
  #     it 'does not update the applicant' do
  #       patch applicant_path(applicant), params: { applicant: { email: nil } }
  #       applicant.reload
  #       expect(applicant.email).not_to be_nil
  #     end
  #   end
  # end
end
