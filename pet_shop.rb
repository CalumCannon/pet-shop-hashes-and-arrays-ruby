def pet_shop_name(in_shop)
  return in_shop[:name]
end

def total_cash(in_shop)
  return in_shop[:admin][:total_cash]
end

def add_or_remove_cash(in_shop, cash_difference)
  in_shop[:admin][:total_cash] += cash_difference
end

def pets_sold(in_shop)
 return in_shop[:admin][:pets_sold]
end

def increase_pets_sold(in_shop, pets_sold_amount)
  in_shop[:admin][:pets_sold] += pets_sold_amount
end

def stock_count(in_shop)
  return in_shop[:pets].count
end

def pets_by_breed(in_shop, breed)
# return array of pets of certain breed
pet_array = in_shop[:pets]
pet_breed_array = []
  for pet in pet_array
    if(pet[:breed] == breed)
      pet_breed_array.push(pet)
    end
  end
  return pet_breed_array
end

def find_pet_by_name(in_shop, in_name)
  for pet in in_shop[:pets]
    if pet[:name] == in_name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(in_shop, pet_to_remove)
  in_shop[:pets].delete(find_pet_by_name(in_shop, pet_to_remove))
end

# def remove_pet_by_name(in_shop, pet_name)
#
#   pet_array = in_shop[:pets]
#   pet_to_delete = find_pet_by_name(in_shop, pet_name)
#   pet_array.delete(pet_to_delete)
#
# end

def add_pet_to_stock(in_shop, in_pet)
 in_shop[:pets].push(in_pet)
end

def customer_cash(in_customer)
   return in_customer[:cash]
end

def remove_customer_cash(in_customer, cash_to_deduct)
  in_customer[:cash] -= cash_to_deduct
end

def customer_pet_count(in_customer)
  return in_customer[:pets].count
end

def add_pet_to_customer(in_customer, new_pet)
  # add pet to new customer
  in_customer[:pets].push(new_pet)
end

def customer_can_afford_pet(in_customer, pet_to_purchase)
  if(customer_cash(in_customer) >=  pet_to_purchase[:price])
      return true
    else
      return false
  end
end

def sell_pet_to_customer(in_shop, in_pet, in_customer)
  # if customer can afford...
  if in_pet == nil
    return
  end
  
  if(customer_can_afford_pet(in_customer, in_pet))

    # add pet to customer
    add_pet_to_customer(in_customer, in_pet)

    # remove pet from shop
    remove_pet_by_name(in_shop, in_pet)

    # increase pets sold value
    increase_pets_sold(in_shop, 1)

    # remove customer cash
    remove_customer_cash(in_customer, in_pet[:price])

    # add cash to shop
    add_or_remove_cash(in_shop, in_pet[:price])

  end
  return
end
