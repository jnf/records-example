class LabelsController < ApplicationController
  def index
    @labels = Label.order(:title)
  end

  def show
    @label = Label.includes(:artists).find(params[:id])
  end

  def new
    @label = Label.new
  end

  def create
    @label = Label.new params[:label]

    if @label.save
      redirect_to label_path(@label)
    else
      render :new
    end
  end

  def edit
    @label = Label.find params[:id]
    render :new
  end

  def update
    @label = Label.find params[:id]
    
    if @label.update(label_params)
      redirect_to label_path(@label)
    else
      render :new
    end
  end

  def destroy
    message = if Label.destroy(params[:id])
                "Label destroyed!"
              else
                "Couldn't destroy label!"
              end

    redirect_to labels_path, notice: message
  end
end
