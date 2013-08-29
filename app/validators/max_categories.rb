class MaxCategories < ActiveModel::Validator
  def validate(record)
    return true if record.category_list.count < 3
    record.errors[:category_list] << 'Please select only three categories'
  end
end