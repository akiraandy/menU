require 'rails_helper'

RSpec.describe MenuMenuItem, type: :model do
  it { should belong_to :menu }
  it { should belong_to :menu_item }
end
