require 'rails_helper'

describe Article do
  # before do
  #   @article = FactoryGirl.build(:article)
  # end
  let(:article){FactoryGirl.build(:article)}
  subject{article}

  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:publication_date) }
  it { is_expected.to respond_to(:genre_id) }
  it { is_expected.to respond_to(:description)}
  it { is_expected.to respond_to(:article)}
  it { is_expected.to respond_to(:genre_id)}
  it { is_expected.to respond_to(:area_id)}
  it { is_expected.to respond_to(:group_id)}
  it { is_expected.to respond_to(:spice_id)}
  it { is_expected.to respond_to(:photo)}

  it { is_expected.to have_attached_file(:photo) }
  it { is_expected.to validate_attachment_presence(:photo) }
  it { is_expected.to validate_attachment_content_type(:photo).allowing('image/png', 'image/gif').
          rejecting('text/plain', 'text/xml') }
  it { is_expected.to be_valid}

  describe "#title" do
    describe "when it is valid" do
      it {is_expected.to be_valid}
    end
    describe "when it is empty" do
      before do
        article["title"] = ""
      end
      it {is_expected.not_to be_valid}
    end
    describe "when title is over 100 chars" do
      before do
        article.title = ""
        101.times do
          article.title << "あ"
        end
      end
      it { is_expected.not_to be_valid }
    end
  end

  describe "#publication_date" do
    describe "when it is valid" do
      it {is_expected.to be_valid}
    end

    describe "when it is not date" do
      before do
        article.publication_date = "yyyy/mm/dd"
      end
      it{ is_expected.not_to be_valid }
    end

    describe "when it is empty" do
      before do
        article.publication_date = ""
      end
      it{ is_expected.not_to be_valid}
    end
  end

  describe "#description" do
    describe "when it is valid" do
      it {is_expected.to be_valid}
    end

    describe "when it is empty" do
      before do
        article.description = ""
      end
      it {is_expected.not_to be_valid}
    end

    describe "when it is over 100 chars" do
      before do
        article.description = ""
        201.times do
          article.description << "あ"
        end
      end
      it {is_expected.not_to be_valid}
    end
  end

  describe "#genre_id" do
    describe "when it is valid" do
      it {is_expected.to be_valid}
    end

    describe "when it is empty" do
      before do
        article.genre_id = nil
      end
      it {is_expected.not_to be_valid}
    end
  end
end
