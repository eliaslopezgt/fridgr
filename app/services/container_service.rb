class ContainerService
  def initialize(container)
    @container = container
  end

  def store_item(item_to_store)
    p item_to_store
    binding.pry
  end
end
