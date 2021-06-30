def range_iterative(start, ending)
    arr = []
    (start...ending).each do |i|
        arr << i
    end
    arr
end

def range_recursive(start, ending)
    return [] if ending <= start
    [start] + range_recursive(start+1, ending)
end

def recursion1(b, n)
    return 1 if n==0
    b * recursion1(b, n-1)
end

def recursion2(b, n)
    return 1 if n==0
    return b if n==1
    return recursion2(b, n/2)*recursion2(b, n/2) if n.even?
    b*(recursion2(b, ((n-1)/2)*((n-1)/2)))
end

class Array
    def deep_dup
        arr = []
        self.each do |ele|
            if ele.is_a?(Array)
                arr << ele.deep_dup
            else
                arr << ele
            end
        end
        arr
    end
end

def merge_sort(array)
    return array if array.length <= 1

    middle = array.length/2
    left_side = merge_sort(array[0...middle])
    right_side = merge_sort(array[middle..-1])
    merge(left_side,right_side)

end

def merge(left_side, right_side)
    return right_side if left_side.length == 0
    return left_side if right_side.length == 0

    smaller = 0
    if left_side[0] < right_side[0]
        smaller = left_side.shift
    else
        smaller = right_side.shift
    end

    array = merge(left_side, right_side)

    [smaller].concat(array)
end

# p merge_sort([3,4,10,7,2,11,53,29])
