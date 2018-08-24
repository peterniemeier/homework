def sum_to(n)
  return nil if n < 1
  return 1 if n == 1
  result = n + sum_to(n - 1)
end

def add_numbers(arr)
  return [] if arr.count <= 0
  return arr[0] if arr.count == 1

  piece = arr.drop(1)
  result = arr[0] + add_numbers(piece)
end

def gamma_fnc(n)
  return nil if n < 1
  return 1 if n == 1

  (n - 1) * gamma_fnc(n - 1)
end

def factorial(n)
  return 1 if n == 1

  n * factorial(n - 1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.count <= 0
  return true if flavors[0] == favorite

  remaining_flavors = flavors.drop(1)
  ice_cream_shop(remaining_flavors,favorite)
end

def reverse(string)
  return string if string.length <= 1

  portion = string[0...-1]
  string[-1] + reverse(string[0...-1])
end


def quick_sort(arr)
  return arr if arr.count <= 1

pivot = [arr.first]
left = arr[1..-1].select { |el| el < arr.first }
right = arr[1..-1].select { |el| el >= arr.first }

quick_sort(left) + pivot + quick_sort(right)

end
