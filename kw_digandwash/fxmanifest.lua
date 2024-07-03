fx_version('cerulean')
games({ 'gta5' })
description 'kw-test-ox'

server_scripts{
  'sv_main.lua'
}

shared_script {
  '@ox_lib/init.lua',
  'config.lua'
}

client_scripts{
    'cl_main.lua'
}

lua54 'yes'