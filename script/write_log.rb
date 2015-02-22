require 'clockwork'
include Clockwork

DIR_NAME = './log/'
TIME_FORMAT = '%Y_%m_%d'

every(5.seconds, 'write') do
  process_count = `ps aux | wc -l`.strip
  fname = DIR_NAME +  Time.now.strftime(TIME_FORMAT) + '.log'
  content = "#{process_count}\t#{Time.now.to_s}"
  f = open(fname, 'a')
  f.puts(content)
  f.close
end
