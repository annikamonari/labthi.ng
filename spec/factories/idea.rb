FactoryGirl.define do
  factory :idea do
    brief 'Valid brief'
    phase 1
    active true
    industry 'Technology'

    factory :idea_with_aspects do

      ignore do
        aspects_count 5
      end

      after_create do |idea, evaluator|
        FactoryGirl.create_list(:aspect, evaluator.aspects_count, idea: idea)
      end
    end
    user
  end
end