class TagsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    ###tags = TagSelector.call
    ###render json: { "tags": @tags }
    @tags = Tag.all.map{|tag| tag.name}
    @tags = @tags.filter{|item| != "green"}
    @count = @tags.size
    @newTags = []
    for @i in 0..@count-1
      @newTags.append(@tags.fetch(@i))
    end
    render json: {"tags": @newTags}
  end
end