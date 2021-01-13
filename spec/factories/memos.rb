FactoryBot.define do
  factory :memo1 do
    subject { 'subject1' }
    memo { 'memo1' }
  end

  factory :memo2 do 
    subject { 'subject2' }
    memo { 'memo2' }
  end

  factory :memo3 do 
    subject { 'subject3' }
  end
end
