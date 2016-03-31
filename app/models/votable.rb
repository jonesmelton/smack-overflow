module Votable
  def score
    self.votes.sum(:vote_value)
  end

  def place_vote(vote_type, current_user)
    # voted_object = self.class.find(self.id)
    @vote = Vote.new(vote_value: tally_vote(vote_type),
      user: current_user,
      votable_type: self.class.to_s,
      votable_id: self.id)
    @vote.save
  end

  def tally_vote(vote_type)
    if vote_type == "💩"
      vote_value = -1
    else
      vote_value = 1
    end

  end

end
