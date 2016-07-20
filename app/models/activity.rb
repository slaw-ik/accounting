class Activity < ActiveRecord::Base
  belongs_to :user
  ACTION_TYPES = [:sign_in, :manually_sign_out, :automatically_sign_out, :session_expired]

  enum action_type: ACTION_TYPES

  default_scope { order(created_at: :desc) }
  scope :filter_conditions, -> (action_type) { where(category_condition(action_type)) }

  def self.action_types
    ACTION_TYPES.map.with_index { |type, index| {name: I18n.t(type), id: index} }
  end

  private
  def self.category_condition(action_type)
    {action_type: action_type} if action_type != '-1'
  end

end
