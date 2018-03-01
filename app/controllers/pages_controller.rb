class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home

    if params[:query].present?

# split words
@parms = params[:query].split

#  initialize array

@horses = []
      # for each word search
      @parms.each do |word|

        @result = PgSearch.multisearch(word)

        # for each result add horse if ok

        @result.each do |result|

        # check if horse is already present

        if !@horses.find{ |horse| horse.id == result.searchable_id}
          @horses << Horse.find(result.searchable_id)
        end


      end
    end

      #  no search > random
    else
      # @horses = policy_scope(Horse)
      @horses = Horse.all.sample(6)
    end
  end
end
