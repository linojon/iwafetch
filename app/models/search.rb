class Search < ActiveRecord::Base
  require "hpricot"
  require 'open-uri'
  
  def fetch
    #debugger
    case self.service
    when "google_news" :
      q = self.terms.gsub('"','%22').gsub("'", '%27').gsub(' ','+')
      # ned=tus => text version
      doc = Hpricot(open("http://news.google.com/news?ned=tus&scoring=n&q=#{q}"))

      #self.body = (doc/".mainbody").inner_html
      #debugger
      # Firebug says: /html/body/table[3]/tbody/tr/td[2]/div/table
      # as of 11/6/2008:  /html/body/table[2]/tbody/tr[2]/td/table/tbody/tr/td[2]/div/table/tbody/tr/td/table
      # table = (doc/"/html/body/table")[1] # 2nd table
      # tr = (table/"tbody/tr")[1] # 2nd tr
      # td = (tr/"td")[2]
      # content = (td/"table")
      # self.body = content.to_html
      
      # as of 2/26/2009
      main_table = (doc/"table#main-table")[0]
      self.body = (main_table/"table.left").to_html
      
      self.save
    end
  end
  # /html/body/table[2]/tbody/tr[2]/td/table/tbody/tr/td[2]/div/table/tbody/tr/td/table
  #/html/body/table/tbody/tr[2]/td/table/tbody/tr/td[2]/div/table/tbody/tr/td/table
  
end
# /html/body/table[3]/tbody/tr/td[2]/div/table/tbody/tr/td

# eval x = doc/"/html/body/table[3]"
# eval y = x/"table/tbody/tr/td[1]"


# eval x = doc/"/html/body/table" returns array of 3 tables, we want x[2]
# eval y = x[2]/"tbody/tr/td" there's 2 td's but the first one has class="leftnav" which isnt included, so y is size=1
# eval z = y[0]

#/html/body/table[3]/tbody/tr/td[2]/div/table
# 

# eval x = doc/"/html/body/table" returns array of 3 tables, we want x[2]
# eval y= x[2]/"table/tbody/tr"   size=1