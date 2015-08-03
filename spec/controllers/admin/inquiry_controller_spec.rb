require 'rails_helper'

RSpec.describe Admin::InquiryController, :type => :controller do
  it 'render template index' do
    get :index
    expect(response).to render_template :index
  end

  it 'render template show' do
    get :index
    expect(response).to render_template :show
  end

end
