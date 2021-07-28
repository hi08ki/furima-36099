class PurchasesController < ApplicationController
  def index
    @purchase = Purchase.all
  end