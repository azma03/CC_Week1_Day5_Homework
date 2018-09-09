def pet_shop_name(pet_shop)
  return pet_shop[:name]
end


def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end


def add_or_remove_cash(pet_shop, cash)
  #pet_shop[:admin][:total_cash] += cash
  pet_shop[:admin][:total_cash] = total_cash(pet_shop) + cash
end


def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end


def increase_pets_sold(pet_shop, number)
  pet_shop[:admin][:pets_sold] = pets_sold(pet_shop) + number
end


def stock_count(pet_shop)
  return pet_shop[:pets].length()
end


def pets_by_breed(pet_shop, breed)
  breed_pets = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      breed_pets.push(pet)
    end
  end
  return breed_pets
end


def find_pet_by_name(pet_shop, pet_name)
  #found_pet_name = {}
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      return pet
    end
  end
  return nil
  # if pet_shop[:pets].include?(pet_name)
  #   return pet_shop[:pets]
  # end
end


def remove_pet_by_name(pet_shop, pet_name)
  pet = find_pet_by_name(pet_shop, pet_name)
  if (pet != nil)
    pet_shop[:pets].delete(pet)
  end
end


def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end


def customer_cash(customer)
  return customer[:cash]
end


def remove_customer_cash(customer, cash_to_remove)
  customer[:cash] = customer_cash(customer) - cash_to_remove
end


def customer_pet_count(customer)
  return customer[:pets].length()
end


def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end


def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end


def sell_pet_to_customer(pet_shop, pet, customer)
  #find pet by pet_name. - didn't need to call the function find_pet_by_name()
  # as 'pet' argument is already the result of calling that function.
  #check if the customer has enough funds
  if ((pet!= nil) && customer_can_afford_pet(customer, pet))

      #&& (find_pet_by_name(pet_shop, pet[:name]) != nil)

      #take out the pet's price from the customer's cash
      customer[:cash] -= pet[:price]

      #add the pet price to the pet_shop's total cash
      pet_shop[:admin][:total_cash] += pet[:price]

      #add the pet to customer's pet array
      add_pet_to_customer(customer, pet)
      #customer[:pets].push(pet)

      #increment pet sold counter of the pet_shop
      pet_shop[:admin][:pets_sold] +=1

      #remove the pet from stock
      remove_pet_by_name(pet_shop, pet[:name])

  end

end
