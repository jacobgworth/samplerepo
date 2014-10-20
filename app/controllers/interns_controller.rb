class InternsController < ApplicationController
  # GET /interns
  # GET /interns.json
  def index
    @interns = Intern.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @interns }
    end
  end

  # GET /interns/1
  # GET /interns/1.json
  def show
    @intern = Intern.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @intern }
    end
  end

  # GET /interns/new
  # GET /interns/new.json
  def new
    @intern = Intern.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @intern }
    end
  end

  # GET /interns/1/edit
  def edit
    @intern = Intern.find(params[:id])
  end

  # POST /interns
  # POST /interns.json
  def create
    @intern = Intern.new(params[:intern])

    respond_to do |format|
      if @intern.save
        format.html { redirect_to @intern, notice: 'Intern was successfully created.' }
        format.json { render json: @intern, status: :created, location: @intern }
      else
        format.html { render action: "new" }
        format.json { render json: @intern.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /interns/1
  # PUT /interns/1.json
  def update
    @intern = Intern.find(params[:id])

    respond_to do |format|
      if @intern.update_attributes(params[:intern])
        format.html { redirect_to @intern, notice: 'Intern was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @intern.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interns/1
  # DELETE /interns/1.json
  def destroy
    @intern = Intern.find(params[:id])
    @intern.destroy

    respond_to do |format|
      format.html { redirect_to interns_url }
      format.json { head :no_content }
    end
  end
end
