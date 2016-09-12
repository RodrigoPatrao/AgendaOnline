class ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @contacts = Contact.where(user_id: current_user.id)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @user = User.find(current_user)
    @contact = @user.contacts.new(params[:contact].permit(:contactName, :contactEmail, :contactPhone))
    if @contact.save
      flash[:success] = "Contato salvo com sucesso!"
      redirect_to contacts_path
    else
      flash[:danger] =
      "Não foi possível salvar o contato.Cheque as informações e tente novamente (verifique se há campos em branco)."
      render 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(params[:contact].permit(:contactName, :contactEmail, :contactPhone))
      flash[:success] = "Alterações salvas com sucesso!"
      redirect_to contacts_path
    else
      flash[:danger] = "Confira as informações passadas e tente novamente."
      render 'edit'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:success] = "Contato excluído."
    redirect_to contacts_path
  end

end
