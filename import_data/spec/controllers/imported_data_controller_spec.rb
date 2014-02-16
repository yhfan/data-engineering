require 'spec_helper'

describe ImportedDataController do

  describe 'GET #new' do
    it 'should render the new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    it 'should render the new template' do
      post :create, imported_datum: {}
      expect(response).to render_template :new
    end

    context 'when no parameter is given' do
      it 'should render the new template' do
        post :create
        expect(response).to render_template :new
      end
    end

    context 'when the file is specified' do
      context 'and the data can be imported' do
        before(:each) do
          ImportedDatum.any_instance.stub(:import).and_return(100.0)
        end

        it 'should show the gross revenue' do
          post :create, imported_datum: { file: 'some file.tab' }
          expect(flash[:notice]).to include(' $100.00')
        end
      end

      context 'but the data cannot be imported' do
        before(:each) do
          ImportedDatum.any_instance.stub(:import).and_return(false)
        end

        it 'should show an error message' do
          post :create, imported_datum: { file: 'bad file.tab' }
          expect(flash[:warning]).to be_present
        end
      end
    end
  end

end

