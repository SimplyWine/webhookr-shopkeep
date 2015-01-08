class ShopKeepHooks

  def on_event(incoming)
    payload = incoming.payload
    puts 'shopkeep on_event webhook:'
    puts payload
  end
  
end