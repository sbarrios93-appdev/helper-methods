class DirectorsController < ApplicationController
  def new
    @director = Director.new
  end

  def index
    matching_directors = Director.all

    @directors = matching_directors.order(created_at: :desc)

    respond_to do |format|
      format.json do
        render json: @directors
      end

      format.html
    end
  end

  def show
    @director = Director.find(params.fetch(:id))
  end

  def create
    @director = Director.new(params.require(:director).permit(:name, :dob))

    if @director.valid?
      @director.save
      redirect_to directors_path, notice: "Director created successfully."
    else
      render "new"
    end
  end

  def edit
    @director = Director.find(params.fetch(:id))
  end

  def update
    director = Director.find(params.fetch(:id))


    director.name = params.fetch(:director).fetch(:name)
    director.dob = params.fetch(:director).fetch(:dob)

    if director.valid?
      director.save
      redirect_to director_path(director), notice: "Director updated successfully."
    else
      redirect_to director(director), alert: "Director failed to update successfully."
    end
  end

  def destroy
    director = Director.find(params.fetch(:id))
    director.destroy

    redirect_to directors_path, notice: "Director deleted successfully."
  end
end
