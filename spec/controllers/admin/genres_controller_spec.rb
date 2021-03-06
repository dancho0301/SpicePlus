require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe Admin::GenresController do

  # This should return the minimal set of attributes required to create a valid
  # Genre. As you add validations to Genre, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GenresController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all genres as @genres" do
      genre = Genre.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:genres)).to eq([genre])
    end
  end

  describe "GET show" do
    it "assigns the requested genre as @genre" do
      genre = Genre.create! valid_attributes
      get :show, {:id => genre.to_param}, valid_session
      expect(assigns(:genre)).to eq(genre)
    end
  end

  describe "GET new" do
    it "assigns a new genre as @genre" do
      get :new, {}, valid_session
      expect(assigns(:genre)).to be_a_new(Genre)
    end
  end

  describe "GET edit" do
    it "assigns the requested genre as @genre" do
      genre = Genre.create! valid_attributes
      get :edit, {:id => genre.to_param}, valid_session
      expect(assigns(:genre)).to eq(genre)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Genre" do
        expect {
          post :create, {:genre => valid_attributes}, valid_session
        }.to change(Genre, :count).by(1)
      end

      it "assigns a newly created genre as @genre" do
        post :create, {:genre => valid_attributes}, valid_session
        expect(assigns(:genre)).to be_a(Genre)
        expect(assigns(:genre)).to be_persisted
      end

      it "redirects to the created genre" do
        post :create, {:genre => valid_attributes}, valid_session
        expect(response).to redirect_to(Genre.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved genre as @genre" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Genre).to receive(:save).and_return(false)
        post :create, {:genre => { "name" => "invalid value" }}, valid_session
        expect(assigns(:genre)).to be_a_new(Genre)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Genre).to receive(:save).and_return(false)
        post :create, {:genre => { "name" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested genre" do
        genre = Genre.create! valid_attributes
        # Assuming there are no other genres in the database, this
        # specifies that the Genre created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Genre).to receive(:update).with({ "name" => "MyString" })
        put :update, {:id => genre.to_param, :genre => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested genre as @genre" do
        genre = Genre.create! valid_attributes
        put :update, {:id => genre.to_param, :genre => valid_attributes}, valid_session
        expect(assigns(:genre)).to eq(genre)
      end

      it "redirects to the genre" do
        genre = Genre.create! valid_attributes
        put :update, {:id => genre.to_param, :genre => valid_attributes}, valid_session
        expect(response).to redirect_to(genre)
      end
    end

    describe "with invalid params" do
      it "assigns the genre as @genre" do
        genre = Genre.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Genre).to receive(:save).and_return(false)
        put :update, {:id => genre.to_param, :genre => { "name" => "invalid value" }}, valid_session
        expect(assigns(:genre)).to eq(genre)
      end

      it "re-renders the 'edit' template" do
        genre = Genre.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Genre).to receive(:save).and_return(false)
        put :update, {:id => genre.to_param, :genre => { "name" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested genre" do
      genre = Genre.create! valid_attributes
      expect {
        delete :destroy, {:id => genre.to_param}, valid_session
      }.to change(Genre, :count).by(-1)
    end

    it "redirects to the genres list" do
      genre = Genre.create! valid_attributes
      delete :destroy, {:id => genre.to_param}, valid_session
      expect(response).to redirect_to(genres_url)
    end
  end

end
