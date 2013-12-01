class LabEvaluation < ActiveRecord::Base
  belongs_to :evaluator
  belongs_to :content_creator
  belongs_to :content, polymorphic: true
end
