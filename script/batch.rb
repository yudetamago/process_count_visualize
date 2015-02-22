DIR_NAME = './log/'
TIME_FORMAT = '%Y_%m_%d'

def prosess_count
  `ps aux | wc -l`.strip
end

def current_time
  Time.now.to_s
end

def file_name
  DIR_NAME +  Time.now.strftime(TIME_FORMAT) + '.log'
end

def write(name, content)
  open(name, 'a').puts(content)
end

content = prosess_count + "\t" + current_time
write(file_name, content)
