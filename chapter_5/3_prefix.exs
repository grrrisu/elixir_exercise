# nested functions
prefix = fn prefix ->
  fn name -> "#{prefix} #{name}" end
end

mr = prefix.('Mr.')
mrs = prefix.('Mrs.')

IO.puts mr.('Smith')
IO.puts mrs.('Miller')
