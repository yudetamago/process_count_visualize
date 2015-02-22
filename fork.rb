50.times do |n|
  Process.fork { sleep n }
end
Process.waitall
