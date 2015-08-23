require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:given_name) }
    it { is_expected.to validate_presence_of(:family_name) }
    it { is_expected.to validate_presence_of(:age) }
    it { is_expected.to validate_numericality_of(:age).
         only_integer.
         is_greater_than_or_equal_to(0).
         is_less_than_or_equal_to(100) }
  end

  describe '#full_name' do
    subject { FactoryGirl.create(:user, given_name: given_name, family_name: family_name) }
    let(:given_name) { 'Elliot' }
    let(:family_name) { 'Alderson' }

    it 'returns full name based on given and family name' do
      expect(subject.full_name).to eq('Elliot Alderson')
    end

    context 'when given name is longer than 10 characters' do
      let(:given_name) { 'Sheng Loong' }

      it 'only show initial of the given name in the full name' do
        expect(subject.full_name).to eq('S Alderson')
      end
    end
  end

  shared_examples_for 'age group for' do |age, group|
    subject { FactoryGirl.create(:user, age: age) }
    let(:age) { age }

    it "assigns age #{age} to group #{group}" do
      expect(subject.age_group).to eq(group)
    end
  end

  it_behaves_like 'age group for', 0, :group1
  it_behaves_like 'age group for', 1, :group1
  it_behaves_like 'age group for', 12, :group1

  it_behaves_like 'age group for', 13, :group2
  it_behaves_like 'age group for', 17, :group2
  it_behaves_like 'age group for', 18, :group3

  it_behaves_like 'age group for', 30, :group3
  it_behaves_like 'age group for', 31, :group3
  it_behaves_like 'age group for', 100, :group3
end
