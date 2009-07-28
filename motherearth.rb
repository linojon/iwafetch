require 'rubygems'
require 'mechanize'

def dopoll
  agent = WWW::Mechanize.new
  page = agent.get('http://www.motherearthnews.com/poll.aspx')
  poll = page.form('aspnetForm') 
  poll.radiobuttons.last.checked=true
  page = agent.submit( poll, poll.buttons[3])
end

