desc '現在のプロセス数と現在時刻をログに書き込む'
task :write_log do
  DIR_NAME = './log/'
  TIME_FORMAT = '%Y_%m_%d'

  process_count = `ps aux | wc -l`.strip
  fname = DIR_NAME +  Time.now.strftime(TIME_FORMAT) + '.log'
  content = "#{process_count}\t#{Time.now.to_s}"
  FileUtils.mkdir(DIR_NAME) if !File.exist?(DIR_NAME)
  f = open(fname, 'a')
  f.puts(content)
  f.close
end
