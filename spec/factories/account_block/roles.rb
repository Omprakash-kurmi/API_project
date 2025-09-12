FactoryBot.define do
  factory :role, class: 'AccountBlock::Role' do
    name { "Vandor" }
    status {"active" }
  end
end
