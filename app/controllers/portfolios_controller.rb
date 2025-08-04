class PortfoliosController < ApplicationController
  allow_unauthenticated_access only: %i[index show]
  before_action :set_portfolio, only: %i[show edit update destroy]

  def index
    @portfolios = Portfolio.all
  end

  def show; end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    if @portfolio.save
      redirect_to @portfolio
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @portfolio.update(portfolio_params)
      redirect_to @portfolio
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @portfolio.destroy
    redirect_to portfolios_path
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.expect(portfolio: %i[name description featured_image])
  end
end
