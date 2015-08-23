class User < ActiveRecord::Base
  validates :given_name, presence: true
  validates :family_name, presence: true
  validates :age, presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 100
    }

  FULL_GIVEN_NAME_MAX_LENGTH = 10

  def full_name
    "#{short_given_name} #{family_name}"
  end

  def age_group
    return :group1 if age < 13
    return :group2 if age < 18
    return :group3 if age < 31
    :group3
  end

  private

  def short_given_name
    given_name.length > FULL_GIVEN_NAME_MAX_LENGTH ? given_name[0] : given_name
  end
end
