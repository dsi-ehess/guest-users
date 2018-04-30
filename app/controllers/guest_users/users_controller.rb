class GuestUsers::UsersController < GuestUsers::ApplicationController

  before_action :check_feature_enabled, only: [:new]
  #TODO check user authenticated and ehess member everywhere
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

  with_themed_layout 'dashboard'

  # GET /guests
  # GET /guests.json
  def index
    @users = GuestUsers::User.where(host: current_user) || []
  end

  # GET /guests/1
  # GET /guests/1.json
  def show
  end

  # GET /guests/new
  def new
    @user = GuestUsers::User.new
    respond_to do |format|
      if request.xml_http_request?
        format.html {render :new_for_modal, :layout => false}
      else
        format.html {render :new}
      end
    end
  end

  # GET /guests/1/edit
  def edit
  end

  # POST /guests
  # POST /guests.json
  def create
    @user = GuestUsers::User.new(guest_params)
    @user.host = current_user
    respond_to do |format|
      if @user.save
        @user.guest!
        if request.xml_http_request?
          format.html {render :show_for_modal, :layout => false}
        else
          format.html {redirect_to @user, notice: 'Guest was successfully created.'}
        end
        format.json {render :show, status: :created, location: @user}
      else
        if request.xml_http_request?
          format.html {render :new_for_modal, :layout => false}
        else
          format.html {render :new}
        end

        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /guests/1
  # PATCH/PUT /guests/1.json
  def update
    respond_to do |format|
      if @user.update(guest_params)
        format.html {redirect_to @user, notice: 'Guest was successfully updated.'}
        format.json {render :show, status: :ok, location: @user}
      else
        format.html {render :edit}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html {redirect_to guest_users.users_url, notice: 'Guest was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_guest
    @user = GuestUsers::User.find(params[:id])
  end

  def check_feature_enabled
    redirect_to main_app.root_path, alert: I18n.t("guest_users.feature_disabled") unless Flipflop.guest_users?
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def guest_params
    params.require(:guest_users).permit(:email, :display_name)
  end
end
