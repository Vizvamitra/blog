RSpec::Matchers.define :be_ordered_by do |attribute, order=:asc|
  match do |array|
    previous = array[0][attribute]
    method = {asc: :<, desc: :>}[order.to_sym]

    array.each do |record|
      return false if record[attribute].send(method, previous)
      previous = record[attribute]
    end
  end

  failure_message do |actual|
    "expected array to be ordered by #{attribute} #{order}"
  end

  failure_message_when_negated do |actual|
    "expected array not to be ordered by #{attribute} #{order}"
  end

  description do
    "checks array's order"
  end
end