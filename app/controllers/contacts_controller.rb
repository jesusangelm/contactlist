class ContactsController < ApplicationController
  respond_to :html, :json

  # GET /contacts
  # GET /contacts.json
  def index
    respond_with @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    respond_with @contact = Contact.find(params[:id])
  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @contact = Contact.new
    3.times { @contact.phones.build }
    respond_with @contact
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
    3.times { @contact.phones.build }
    respond_with @contact
  end

  # POST /contacts
  # POST /contacts.json
  def create
    respond_with @contact = Contact.create(params[:contact])
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    respond_with @contact = Contact.update(params[:id], params[:contact])
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    respond_with Contact.destroy params[:id]
  end
end
