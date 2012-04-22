class DealSweeper < ActionController::Caching::Sweeper
  observe Deal
  
  def after_save(state)
    expire_cache(state)
  end
  
  def after_destroy(state)
    expire_cache(state)
  end
  
  def expire_cache(state)
    expire_page :controller => 'deal', :action => 'show'
  end
end

