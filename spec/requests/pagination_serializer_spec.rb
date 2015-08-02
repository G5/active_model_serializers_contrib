require 'spec_helper'

RSpec.describe "PaginationSerializer", type: :request do

  context "there are books" do
    before do
      20.times { create(:book) }
    end

    it "contains pagination information" do
      get "/books", page: 6, per_page: 3, format: :json
      hash = JSON.parse(response.body).with_indifferent_access
      meta = hash[:meta]
      expect(meta[:current_page]).to eq 6
      expect(meta[:total_pages]).to eq 7
      expect(meta[:total_items]).to eq 20
      expect(meta[:prev_page]).to eq 5
      expect(meta[:next_page]).to eq 7
    end

    context "on the first page" do
      it "contains pagination information" do
        get "/books", page: 1, per_page: 5, format: :json
        hash = JSON.parse(response.body).with_indifferent_access
        meta = hash[:meta]
        expect(meta[:current_page]).to eq 1
        expect(meta[:total_pages]).to eq 4
        expect(meta[:total_items]).to eq 20
        expect(meta[:prev_page]).to eq nil
        expect(meta[:next_page]).to eq 2
      end
    end

    context "on the last page" do
      it "contains pagination information" do
        get "/books", page: 10, per_page: 2, format: :json
        hash = JSON.parse(response.body).with_indifferent_access
        meta = hash[:meta]
        expect(meta[:current_page]).to eq 10
        expect(meta[:total_pages]).to eq 10
        expect(meta[:total_items]).to eq 20
        expect(meta[:prev_page]).to eq 9
        expect(meta[:next_page]).to eq nil
      end
    end

    context "no pagination" do
      it "contains pagination information" do
        get "/books/no_pagination", format: :json
        hash = JSON.parse(response.body).with_indifferent_access
        meta = hash[:meta]
        expect(meta[:current_page]).to eq 1
        expect(meta[:total_pages]).to eq 1
        expect(meta[:total_items]).to eq 20
        expect(meta[:prev_page]).to eq nil
        expect(meta[:next_page]).to eq nil
      end
    end
  end

  context "there are no books" do
    it "does not blow up" do
      get "/books/no_pagination", format: :json
      hash = JSON.parse(response.body).with_indifferent_access
      meta = hash[:meta]
      expect(meta[:current_page]).to eq 1
      expect(meta[:total_pages]).to eq 1
      expect(meta[:total_items]).to eq 0
      expect(meta[:prev_page]).to eq nil
      expect(meta[:next_page]).to eq nil
    end
  end

end
