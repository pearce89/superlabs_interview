require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject { described_class.new }

  it 'is valid with valid attributes' do
    subject.title = 'Terminator 2'
    subject.price = 100
    expect(subject).to be_valid
  end
end
