require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do
    it { should_validate_presence_of :first_name }
    it { should_validate_presence_of :last_name }
    it { should_validate_uniqueness_of :emailb}
  end
end
