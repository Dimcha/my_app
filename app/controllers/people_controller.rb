require 'csv'

class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.all
  end

  def show
  end

  def new
    @person = Person.new
  end

  def edit
  end

  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.json { render json: @person, status: :created }
      else
        format.json { render json: @person, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @person.update(person_params)
        format.json { render json: @person, status: :ok }
      else
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @person.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def upload
    @people = []

    CSV.foreach(params[:file].tempfile, :headers => true) do |row|
      person = Person.new(row.to_hash)
      person.save

      @people << person
    end

    respond_to do |format|
      format.html { render json: @people, status: :ok }
    end
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:first_name, :last_name, :email, :phone)
  end
end
