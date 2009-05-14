# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class AnonymousPageExtension < Radiant::Extension
  version "1.0"
  description "Adds a new page type called Anonymous for pages to be hidden from menus and/or sitemaps."
  url ""
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :anonymous
  #   end
  # end
  
  def activate
    Page.send :include, AnonymousPageTags
  end
  
  def deactivate
    
  end
  
end
