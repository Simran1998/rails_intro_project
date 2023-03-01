class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @schools = School.where("name LIKE ?", wildcard_search)
  end
end
