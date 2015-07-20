class Blogpost < ActiveRecord::Base
  def to_s
    "#{title} (#{body})"
  end
end
