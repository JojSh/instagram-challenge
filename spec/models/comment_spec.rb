require 'rails_helper'

describe Comment, type: :model do
  it { should belong_to(:picture).dependent(:destroy) }

  it 'is not valid with less than two characters' do
    comment = Comment.new(thoughts: 'O')
    expect(comment).to have(1).error_on(:thoughts)
    expect(comment).not_to be_valid
  end

  it 'is not valid if comments is duplicate' do
    Comment.create(thoughts: "Don't say this twice" )
    comment = Comment.new(thoughts: "Don't say this twice")
    expect(comment).to have(1).error_on(:thoughts)
    expect(comment).not_to be_valid

    # add user_id to duplication check
  end

end
