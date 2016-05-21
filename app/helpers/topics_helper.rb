module TopicsHelper

  def random_color(attribute)
    num = []
    for i in 0..2
      num << rand(0..200)
    end
    rgb_color = num.join(", ")
    return "#{attribute}: rgb(#{rgb_color});"
  end

end
