class EmailsController < ApplicationController
  def index
    @email = Email.all
  end

  def create
    @email = Email.new(object:Faker::Lorem.sentence, body:Faker::Lorem.paragraph)
    if @email.save
      respond_to do |format|
       format.html { redirect_to root_path }
       format.js { }
      end
      flash[:notice] = "Email created"
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

    def show
      @email = Email.find(params[:id])
      respond_to do |format|
        format.html { redirect_to emails_path }
        format.js { }
       end
    end

    def delete
      @email = Email.find(params[:id])
      @email.destroy
      respond_to do |format|
        format.html { redirect_to emails_path }
        format.js { }
       end
    end


end
