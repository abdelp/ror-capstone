require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/time_entries', type: :request do
  # TimeEntry. As you add validations to TimeEntry, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      TimeEntry.create! valid_attributes
      get time_entries_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      time_entry = TimeEntry.create! valid_attributes
      get time_entry_url(time_entry)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_time_entry_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      time_entry = TimeEntry.create! valid_attributes
      get edit_time_entry_url(time_entry)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new TimeEntry' do
        expect do
          post time_entries_url, params: { time_entry: valid_attributes }
        end.to change(TimeEntry, :count).by(1)
      end

      it 'redirects to the created time_entry' do
        post time_entries_url, params: { time_entry: valid_attributes }
        expect(response).to redirect_to(time_entry_url(TimeEntry.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new TimeEntry' do
        expect do
          post time_entries_url, params: { time_entry: invalid_attributes }
        end.to change(TimeEntry, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post time_entries_url, params: { time_entry: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested time_entry' do
        time_entry = TimeEntry.create! valid_attributes
        patch time_entry_url(time_entry), params: { time_entry: new_attributes }
        time_entry.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the time_entry' do
        time_entry = TimeEntry.create! valid_attributes
        patch time_entry_url(time_entry), params: { time_entry: new_attributes }
        time_entry.reload
        expect(response).to redirect_to(time_entry_url(time_entry))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        time_entry = TimeEntry.create! valid_attributes
        patch time_entry_url(time_entry), params: { time_entry: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested time_entry' do
      time_entry = TimeEntry.create! valid_attributes
      expect do
        delete time_entry_url(time_entry)
      end.to change(TimeEntry, :count).by(-1)
    end

    it 'redirects to the time_entries list' do
      time_entry = TimeEntry.create! valid_attributes
      delete time_entry_url(time_entry)
      expect(response).to redirect_to(time_entries_url)
    end
  end
end
