class StateTransition
  include ActiveModel::Model

  attr_accessor :from_state, :to_state

  
  validate :valid_transition

  ALLOWED_TRANSITIONS = {
    'D' => ['A'],
    'A' => ['T', 'P'],
    'T' => ['P'],
    'P' => []
  }.freeze

  private

 
  def valid_transition
    unless ALLOWED_TRANSITIONS[from_state].include?(to_state)
      errors.add(:base, 'Invalid state transition')
    end
  end
end

