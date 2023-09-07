class Api::StateTransitionsController < ApplicationController
  before_action :authenticate_user! 

  def index
    @state_transitions = StateTransition.all
    render json: @state_transitions
  end

  def create
    @state_transition = StateTransition.new(state_transition_params)

    if @state_transition.save
      render json: @state_transition, status: :created
    else
      render json: @state_transition.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @state_transition = StateTransition.find(params[:id])
    @state_transition.destroy
    head :no_content
  end

  private

  def state_transition_params
    params.require(:state_transition).permit(:from_state, :to_state)
  end
end

