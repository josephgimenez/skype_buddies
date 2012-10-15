require 'win32ole'

skype = WIN32OLE.new('Skype4COM.Skype')
cmd = WIN32OLE.new('Skype4COM.Command')

#attach to Skype client
skype.attach

cmd.Blocking = true
cmd.Timeout = 2000

File.open('userlist.txt').each_line { |user|
    cmd.Command = "SET USER #{user} BUDDYSTATUS 2 Please add me on Skype."
    skype.sendCommand(cmd)
}
