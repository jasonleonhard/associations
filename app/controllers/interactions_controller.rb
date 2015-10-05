class InteractionsController < ApplicationController
  def new
    @context = context
    @interaction = @context.interactions.new
  end

  def create
    @context = context
    @interaction = @context.interactions.new(interaction_params)

    if @interaction.save
      redirect_to context_url(context), notice: "The interaction has been successfully created."
    end
  end

  def edit
    @context = context
    @interaction = context.interactions.find(params[:id])
  end

  def update
    @context = context
    @interaction = @context.interactions.find(params[:id])
    if @interaction.update_attributes(interaction_params)
      redirect_to context_url(context), notice: "The interaction has been updated"
    end
  end

private
  def interaction_params
    params.require(:interaction).permit!
  end

  def context
    if params[:person_id]
      id = params[:person_id]
      Person.find(params[:person_id])
    else
      id = params[:business_id]
      Business.find(params[:business_id])
    end
  end 

  def context_url(context)
    if Person === context
      person_path(context)
    else
      business_path(context)
    end
  end
end
