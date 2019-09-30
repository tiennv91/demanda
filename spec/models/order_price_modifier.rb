require 'rails_helper'

RSpec.describe OrderPriceModifier, type: :model do
  it_behaves_like 'uuidable'

  it { is_expected.to belong_to :order }
  it { is_expected.to belong_to :order_item }
  it { is_expected.to belong_to :product }
  it { is_expected.to belong_to :category }
  it { is_expected.to belong_to :customer }
  it { is_expected.to belong_to :price_modifier }

  it { is_expected.to validate_presence_of :type }
  it { is_expected.to validate_presence_of :price_modifier_id }
end