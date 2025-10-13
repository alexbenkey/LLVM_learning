import lit.formats

config.name = 'minimal-test'
config.test_format = lit.formats.ShTest()
config.suffixes = ['.ll', '.test']
config.test_source_root = '.'
config.test_exec_root = '.'