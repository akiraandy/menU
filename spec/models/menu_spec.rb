require 'rails_helper'

RSpec.describe Menu, type: :model do
  it { should have_many :menu_menu_items }
  it { should have_many :menu_items }
  it { should have_many :items }
  it { should have_many :categories }
end
