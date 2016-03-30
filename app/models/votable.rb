module Votable
  def score
    self.votes.sum(:vote_value)
  end
end
