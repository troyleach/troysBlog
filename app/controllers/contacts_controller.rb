class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @page_title = 'Contact'
    @css_sytle = 'main-blog-title'
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      redirect_to posts_path
      flash[:success] = 'Thank you for your message. I will contact you soon!'
    else
      flash[:error] = 'Cannot send message.'
      render :new
    end
  end
end
