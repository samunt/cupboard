class CupboardsController < ApplicationController
  before_action :require_login

  def index
    @cupboards = Cupboard.all
  end

  def new
    @cupboard = Cupboard.new
  end

  def show

    #connects with walmart api
    require "walmart_open"

    client = WalmartOpen::Client.new do |config|
      ## Product API
      config.product_api_key = ENV['walmart_api_key']

      # This value defaults to 5.
      config.product_calls_per_second = 4

      # Set this to true for development mode.
      config.debug = true
    end

    # Search
    @res = client.search("ipod")
    #=> SearchResults
    # example of res
    # res.query = "ipod"
    # res.total = 53259
    # res.start = 1
    # res.page = ?
    # res.items = [ Item_1, Item_2 ....]

    # Lookup (by item id)
    @item = client.lookup(15076191)
    #=> item is of class WalmartOpen::Item, see WalmartOpen::Item section for detail
    # When item not found, an error of class WalmartOpen::ItemNotFoundError is thrown,
    # eg: {"errors"=>[{"code"=>4002, "message"=>"Invalid itemId"}]}
    # When walmart api is down, an error of class WalmartOpen::ServerError is thrown,
    # eg: {"errors"=>[{"code"=>504, "message"=>"Gateway Timeout"}]}

    # Taxonomy
    taxonomies = client.taxonomy
    #=> Array
    # when success, example of one of taxonomies
    # taxonomies.categories = {"id"=>"5438", "name"=>"Apparel", "path"=>"Apparel", "children"=>[{"id"=>"5438_426265",
    # "name"=>"Accessories", "path"=>"Apparel/Accessories", "children"=>[{"id"=>"5438_426265_1043621",
    #   "name"=>"Bandanas", "path"=>"Apparel/Accessories/Bandanas"}, ...]]}

    # Search special feeds (by feed type, category id)
    # Feed type can be :preorder, :bestsellers, :rollback, :clearance, :specialbuy
    # For :preorder case, you do not need to pass param category_id
    # items = client.feed(:bestsellers, category_id)
    #=> Array
    # when success: items is an array of WalmartOpen::Item items
    # if @cupboard = Cupboard.find(params[:id])
    #   # require 'rubygems'
    #   # require 'rest_client'
    #   # require 'cgi'
    #   # url = 'https://api.shop.com:8443/stores/v1/products/{prodID}'.gsub('{prodID}',CGI::escape('874694776'))
    #   # headers  = { 'apikey' => 'l7xx1c4621368c824e9e88aef19ff99def17' , :params => { CGI::escape('allperms') => 'false' } }
    #   # response = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers
    #   #
    # else
    #   redirect_to new_cupboard_path
    # end
  end

  def create
    @user = User.find(params[:user_id])
    @cupboard = @user.cupboards.new(cupboard_params)
    if @cupboard.save
      redirect_to edit_user_cupboard_path(@user, @cupboard)
    else
      render :new
    end
  end


  def edit
    @cupboard = Cupboard.find(params[:id])
  end

  def update
    @cupboard = Cupboard.find(params[:id])
    if @cupboard.update_attributes(cupboard_params)
      flash[:notice] = "CUPBOARD WAS SUCCESSFULLY UPDATED!"
      redirect_to action: "accents"
    else
      flash[:alert] = "CUPBOARD NOT SUCCESSFULLY UPDATED"
      render :edit
    end
  end

  def accents
    @cupboard = Cupboard.find(params[:id])

    # if @cupboard.update_attributes(cupboard_params)
    #   flash[:notice] = "Updated accents!"
    #   render :show
    #   #redirect_to action: "show"
    # else
    #   flash[:alert] = "CUPBOARD NOT SUCCESSFULLY UPDATED"
    #   render :edit
    # end
  end

  def updateaccent
    @cupboard = Cupboard.find(params[:id])
    @user = User.find(params[:user_id])
    if @cupboard.update_attributes(cupboard_params)
      flash[:notice] = "Updated accents!"
      redirect_to user_cupboard_path
      #redirect_to action: "show"
    else
      flash[:alert] = "CUPBOARD NOT SUCCESSFULLY UPDATED"
      render :edit
    end
  end

  def delete
    @cupboard = Cupboard.find(params[:id])
    @cupboard.destroy
  end

  private
  def cupboard_params
    # I used .fetch because .permit wasnt working. workaround found at http://stackoverflow.com/questions/24944871/actioncontrollerparametermissing-param-is-missing-or-the-value-is-empty-film
    params.fetch(:cupboard, {}).permit(:style, :season, :neutral1, :neutral2, :accent1, :accent2)
  end
end
