object @request

attributes :id, :first_name, :last_name, :check_in, :check_out

child @request.villa do |villa|
  villa.name
end
