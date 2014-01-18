class Rating < ActiveRecord::Base
  belongs_to :beer

    #def to_s
    # "non-string-like"
    #end to_s
end
