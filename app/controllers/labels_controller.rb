class LabelsController < ApplicationController
  def index
    @labels = Label.order(:title)
  end
end
