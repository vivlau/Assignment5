module PostsHelper
  def display_likes(post)
    votes = post.votes.up
    count_likers(votes)
  end
  private
  def count_likers(votes)
    vote_count = votes.size
    vote_count.to_s
  end
end
