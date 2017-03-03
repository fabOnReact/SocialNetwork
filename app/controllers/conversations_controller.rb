class ConversationsController < ApplicationController
=begin
	before_action :authenticate_user

	def index
		@users = User.all
		@conversations = Conversation.all
	end

	def create
		if Conversation.between(params[:sender_id],params[:recipient_id]).present?
			@conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
		else
=end
end