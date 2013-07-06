module IdeasHelper
  def printAspects
    aspects = ""
    @aspects.each do |aspect|
      aspects += aspect.brief
    end
  end
end