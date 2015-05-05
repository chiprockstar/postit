class CommentsController < ApplicationController
  
  before_action :require_user
  

  def create
    @post = Post.find_by slug: params[:post_id]
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.creator = current_user
    if @comment.save
       flash['notice'] = 'Your comment was added.'
       redirect_to post_path(@post)
    else
       render 'posts/show'
    end
  end
  
  
  def vote
    
    @comment = Comment.find(params[:id])
    @vote = Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])
    
    respond_to do |format|
       if @vote.valid?
         flash.now['notice'] = "Your vote was counted."
       else
         flash.now['error'] = "You can only vote for <strong>this comment</strong> once.".html_safe
      end
     # format.html {redirect_to :back, notice: "Your vote was counted."}
      format.js
    end
 
  end
  
  
  
end
