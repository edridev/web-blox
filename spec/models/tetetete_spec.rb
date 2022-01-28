# == Schema Information
#
# Table name: tetetetes
#
#  id         :integer          not null, primary key
#  address    :string
#  city       :string
#  country    :string
#  district   :string
#  full_name  :string
#  name       :string
#  number     :string
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Tetetete, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
