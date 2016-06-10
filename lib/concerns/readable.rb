module Readable
    dic = File.open('cmudict').read.lines
    DICT = dic.map {|entry| entry.strip}
end
