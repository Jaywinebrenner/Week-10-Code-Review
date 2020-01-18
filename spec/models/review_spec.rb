require 'rails_helper'

describe Review do
  it { should validate_presence_of :author }
  it { should belong_to(:product) }
  it { should validate_length_of(:content_body).is_at_most(250) }
  it { should validate_length_of(:content_body).is_at_least(50) }
  it { should
    validate_length_of(:rating).is_at_most(5) }
    it { should
      validate_length_of(:rating).is_at_least(1) }
    end

    describe Review do
      describe '#author' do
        it 'returns the author of the review' do
          test_review = Review.new({:author => 'Freddy Kruegar', :content_body => "I love this product so much, my eyes ache and my heart swells, I am complete and I just fired my Therapist.", :rating => "3 ", :id => nil})
          expect(test_review.author).to eq 'Freddy Kruegar'
        end
      end


      context '#id' do
        it 'returns the id of the review before saving review' do
          review = Review.new({:author => 'Freddy Kruegar', :content_body => "I love this product so much, my eyes ache and my heart swells, I am complete and I just fired my Therapist.", :rating => "3 ", :id => nil})
          expect(review.id).to eq nil
        end
      end


    end
