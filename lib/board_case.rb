# definit une case du plateau de jeu par sa position et son contenu
class BoardCase
  attr_accessor :position, :content
  def initialize(position_to_choose, content_to_choose)
  	@position = position_to_choose
  	@content = content_to_choose
  end
end