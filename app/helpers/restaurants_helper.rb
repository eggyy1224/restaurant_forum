module RestaurantsHelper
  def clip(str)
    arr = str.split("@")
    arr[0]
  end
end
