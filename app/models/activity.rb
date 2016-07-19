class Activity < ActiveRecord::Base
  belongs_to :user

  enum action_type: [:sign_in, :manually_sign_out, :automatically_sign_out, :session_expired]

  default_scope { order(created_at: :desc) }
end
