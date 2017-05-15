class CommentsController < ApplicationController
  def create
    create_comment = Movies::CreateComment.run(
                      params.require(:comment)
                            .merge(user: current_user.uuid)
                            .permit!)

    @movie  = create_comment.result[:movie]
  end
end
