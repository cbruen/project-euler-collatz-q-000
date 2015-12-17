def even_next(n)
  return n / 2
end

def odd_next(n)
  return n*3+1
end

def next_value(n)
   if n.even?
        return even_next(n)
    else
        return odd_next(n)
    end
end

def collatz(n)
    output = [n]
    loop do
    n = next_value(n)
    output.push(n)
    break if n == 1
    end
return output
end

def longest_collatz(l=500000,u=1000000)
  store = {}
count = l

loop do

	tally = 0
	count2 = count
	while(count2 >= 1)

		if !store.has_key?(count2) && count2 != 1
				#output.push(count2)
				count2 = next_value(count2)
				tally+=1
		elsif store.has_key?(count2)
			tally = tally + store[count2]
			store[count] = tally
			count2 = 0
		else
		    tally +=1
		    store[count] = tally
		  count2 = 0
		end
	    #puts output
	end

count+=1
break if count > u

end

store = store.sort_by { |x,y| y}
return store.last[0]
end