class BandsController < ApplicationController

  def index
    render :index
  end

  def new
    render :new
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def create
    band = Band.new(band_params)

    if band.save


      redirect_to bands_url
    else
      flash[:errors] = band.errors.full_messages
    end
  end

  def update

  end

  def destroy

  end

  private

  def band_params
    params.require(:bands).permit(:name)
  end

#     bands#index
#          POST   /bands(.:format)          bands#create
# new_band GET    /bands/new(.:format)      bands#new
# edit_band GET    /bands/:id/edit(.:format) bands#edit
#     band GET    /bands/:id(.:format)      bands#show
#          PATCH  /bands/:id(.:format)      bands#update
#          PUT    /bands/:id(.:format)      bands#update
#          DELETE /bands/:id(.:format)      bands#destroy


end
