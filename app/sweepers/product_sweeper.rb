class ProductSweeper < ActionController::Caching::Sweeper
  observe Product

  def after_save(product)
    clear_product_cache(product)
  end

  def after_destroy(product)
    clear_product_cache(product)
  end

  def clear_product_cache(product)
    expire_page :controller => :products, :action => :index
    expire_page :controller => :products, :action => :show, :id=> product
  end

end


