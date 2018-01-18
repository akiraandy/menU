require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  it { should belong_to :item }
  it { should belong_to :category }
  it { should have_many :menu_menu_items }
  it { should have_many :menus }
  it { should accept_nested_attributes_for :item }
  it { should accept_nested_attributes_for :category }
  it { should validate_length_of :menus }
end
