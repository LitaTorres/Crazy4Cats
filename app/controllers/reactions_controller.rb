class ReactionsController < ApplicationController
    before_action :authenticate_user!
   
    def user_reaction
        @user = current_user
        @publication = Publication.find(params[:publication_id])
        reaction = Reaction.find_by(user_id: @user.id, publication_id: @publication.id)
        if reaction
            respond_to do |format|
                format.html { redirect_to publication_path(@publication), notice: "Ya reaccionaste a esta publicación" }
            end
        else
            @new_reaction = Reaction.new(user_id: @user.id, publication_id: @publication.id, kind: params[:kind])
            respond_to do |format|
                if @new_reaction.save!
                    format.html { redirect_to publication_path(@publication), notice: "#{current_user.email} ha declarado que #{@new_reaction.kind} la publicación" }
                else
                    format.html { redirect_to publication_path(@publication), status: :unprocessable_entity }
                end
            end
        end
    end

    def publication_with_reactions
        @reactions = current_user.reactions
        publication_ids = @reactions.map(&:publication_id)
        @publication = Publication.where(id: publication_ids)
    end

end
