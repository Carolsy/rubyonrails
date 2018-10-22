class SunsController < ApplicationController

  def index
    @suns = Sun.all
  end

  def new
    @sun = Sun.new
  end

  def create
    @sun = Sun.new(sun_params)
    if @sun.save
      flash[:notice] = "保存しました!"
      redirect_to sun_path(@sun)
    else
      render 'new'
    end
  end

  def show
    @sun = Sun.find(params[:id])
  end

  def edit
    @sun = Sun.find(params[:id])
  end

  def update
    @sun = Sun.find(params[:id])
    if @sun.update(sun_params)
      flash[:notice] = "変更しました!"
      redirect_to sun_path(@sun)
    else
      render 'edit'
    end
  end

  def destroy
    @sun = Sun.find(params[:id])
    @sun.destroy
    flash[:notice] = "消しました!"
    redirect_to suns_path
  end

  private

  def sun_params
    params.require(:sun).permit(:head_name, :tail_name)
  end

end


