class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @page_title = '{ "contact": { "name": "Troy Leach" } }'
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      redirect_to posts_path 
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end
