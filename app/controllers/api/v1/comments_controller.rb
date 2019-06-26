# frozen_string_literal: true

class Api::V1::CommentsController < ApplicationController
  def index
    render(
      json: comments,
      each_serializer: Api::V1::Comments::IndexSerializer
    )
  end

  def create
    new_comment = Comment.new(comment_params)
    if new_comment.save
      render json: new_comment, status: :ok
    else
      render json: { errors: new_comment.errors.full_messages }, status: 400
    end
  end

  def show
    render(
      json: comment,
      include: %w[claim user],
      each_serializer: Api::V1::Comment::ShowSerializer
    )
  end

  def update
    if comment.update_attributes(comment_params)
      render json: comment, status: :ok
    else
      render json: { errors: comment.errors.full_messages }, status: 400
    end
  end

  def destroy
    comment.delete
  end

  private

  def comment_params
    params.permit(:comment_text, :claim_id, :user_id)
  end

  def comment
    Comment.find(params[:id])
  end

  def comments
    Claim.find(params[:claim_id]).comments
  end
end
