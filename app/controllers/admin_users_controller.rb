class AdminUsersController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in, except: [:api_show_contacts,
                                             :api_dele_contact,
                                             :api_update_contact,
                                             :api_create_contact]

  def index
    @admin_users = AdminUser.where(createby: session[:username]).sorted
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)
    @admin_user.username = @admin_user.email
    @admin_user.createby = session[:username]
    if @admin_user.save
      flash[:notice] = 'Admin user created.'
      redirect_to(:action => 'index')
    else
      render("new")
    end
  end

  def edit
      @admin_user = AdminUser.find(params[:id])
  end

  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update_attributes(admin_user_params)
      flash[:notice] = 'User\'s contact updated.'
      redirect_to(:action => 'index')
    else
      render("edit")
    end
  end

  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    AdminUser.find(params[:id]).destroy
    flash[:notice] = "Admin user destroyed."
    redirect_to(:action => 'index')
  end

  def contact
      @contacts = request.env['omnicontacts.contacts']
      respond_to do |format|
          format.html
      end
  end

  def creategoo
    @admin_user = AdminUser.new
    name = params[:username].split(/\W+/)
    @admin_user.first_name = name[0]
    @admin_user.last_name = name[1..-1].join(" ")
    @admin_user.username = params[:email]
    @admin_user.email = params[:email]
    @admin_user.createby = session[:username]
    if @admin_user.save
      flash[:notice] = 'Contact created.'
      redirect_to(:action => 'index')
    else
      render("new")
    end
  end

  def api_show_contacts
    self.response_body = ''
    raise 'No "content" sent in the request' unless params[:content]
    content = JSON.parse(params[:content])
    id = request_param_of_type("id", Fixnum, content)
    # curl -X GET -d 'content={"id":1}' http://localhost:3000/get_contactlists

    if id
      @user = AdminUser.find_by(id: id)
      return self.status = 403 unless @user

      contacts = AdminUser.where(Createby: @user.username)

      list = contacts.to_a.map do |u|
        {
          Firstname: u.first_name,
          Lastname: u.last_name,
          Phone: u.phone,
          Email: u.email,
          id: u.id,
          createby: u.createby
        }
      end
      self.status = 200
      self.response_body = {Contacts: list}.to_json
    else
      self.status = 400
    end
  end

  def api_dele_contact
      self.response_body = ' '
      raise 'No "content" sent in the request' unless params[:content]
      content = JSON.parse(params[:content])
      id = request_param_of_type("id", Fixnum, content)
      # curl -X GET -d 'content={"id":13}' http://localhost:3000/del_contact
      raise "id: #{id}" unless AdminUser.exists? id
      AdminUser.find(id).destroy
  end

  def api_update_contact
    self.response_body = ' '
    raise 'No "content" sent in the request' unless params[:content]
    content = JSON.parse(params[:content])
    id = request_param_of_type("id", Fixnum, content)
    raise "id: #{id}" unless AdminUser.exists? id
    # curl -X POST -d 'content={"id":11, "createby":"admin", "first_name":"weo", "last_name":"weo", "email":"ljjdd@hotmail.com", "phone":"111111111"}' http://localhost:3000/update_contact
    if id
      @user = AdminUser.find_by(id: id)
      @user.update_attributes(content)
      self.status = 200
    end
  end

  def api_create_contact
    self.response_body = ' '
    raise 'No "content" sent in the request' unless params[:content]
    content = JSON.parse(params[:content])
    # curl -X POST -d 'content={"createby":"admin", "first_name":"maomoa", "last_name":"namelast", "email":"ljjdd@hotmail.com", "phone":"111111111"}' http://localhost:3000/create_contact
    if content
      @user = AdminUser.new(content)
      @user.save
      self.status = 200
    end
  end

  private

  def admin_user_params
    params.require(:admin_user).permit(:first_name, :last_name,
      :email, :username, :phone)
  end

  def request_param_of_type(parameter, type, params=params)
    request_param = params[parameter]
    raise "No #{parameter} sent in the request" unless request_param
    request_param = request_param.to_i if type == Fixnum and request_param.is_a? String and request_param.match(/^(\d)+$/)
    raise "Provided #{parameter} '#{request_param.to_s}' is not of type: '#{type}'. It is a '#{request_param.class.to_s}'." unless request_param.is_a? type
    request_param
  end

  def render_exceptions_as_json
  begin
    yield
  rescue Exception => e
    render json: {result: false, message: e.message}
    Rails.logger.error e.message + ' ' + e.backtrace.inspect
  end
end

end
