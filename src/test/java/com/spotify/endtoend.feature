Feature: end to end

  Background:
    * configure driver = {type: 'chromedriver', executable:'src\\test\\resources\\chromedriver.exe'}
    * def urlHome = 'https://open.spotify.com/'
    * def userid = '31pwtnpkdgtcxrud2smuljfb3qzi'
    * def playlistid1 = '37i9dQZEVXbMDoHDwVN2tF'
    * def token = 'Bearer BQCSr_ndoCaXkU5v02WyCcf00aLba8m90ZX6sISuhNgxAXvO0uPNdXO5_DpzngncTQhitlbdlXjqYgwy7WU7W7pg7oS1etRlYNav7rtQJCPtBfexVcaHJMQxp_LWMfHSKRSGN4QlfMjXNIUegk7ICGg4ytLiN7AfmipEHw-VPNKd9GGud1RDVtP8jMX0zSGCGLKsrK8LiPoBGPagARv-cGj4dfdtf0Aop58oh0VNZoN505jdt9Ukg0gydzV3tvQKrBNricuu9hdnL2Z_OO_DOBV9UIqDAuFrWVcr3_rR2YSkT7Tl_oCXb0qTD6dosy_xq6OE'


    * def requestbody =
    """
  {
  "public": false
  }
  """
    * def requestartist =
    """
    {
    "ids": ["4nDoRrQiYLoBzwC5BhVJzF"]
    }
    """


    Scenario:
      Given driver "https://open.spotify.com/"
      And maximize()
      And delay(2000)
      When click("//div[@class='ButtonInner-sc-14ud5tc-0 iebPZv encore-inverted-light-set']")
      And delay(2000)
      When click("//input[@id='login-username']")
      And input("//input[@id='login-username']" , 'emre.ozturk@testinium.com')
      And delay(3000)
      And click("//input[@id='login-password']")
      And input("//input[@id='login-password']" , '8898emre')
      And delay(2000)
      When click("//div[@class='ButtonInner-sc-14ud5tc-0 lbsIMA encore-bright-accent-set']")
      And delay(8000)
      And url 'https://api.spotify.com/v1'
      And path 'playlists/2CgKrhV28s5E0ugxaflVC6/followers'
      And header Authorization = token
      And header Content-Type = 'application/json'
      And request requestbody
      When method PUT
      And url 'https://api.spotify.com/v1'
      And path 'playlists/2CgKrhV28s5E0ugxaflVC6/tracks'
      And header Authorization = token
      And header Content-Type = 'application/json'
      And click("//div[@class='AINMAUImkAYJd4ertQxy']")
      And delay(1000)
      And click("//button[@class='Fm7C3gdh5Lsc9qSXrQwO tGKwoPuvNBNK3TzCS5OH']")
      And delay(1000)
      And scroll("//div[@class='Type__TypeElement-goli3j-0 fCtMzo t_yrXoUO3qGsJS4Y6iXX standalone-ellipsis-one-line' and text()='Freedom']")
      And delay(4000)
      And url 'https://api.spotify.com/v1'
      And path 'me/following?type=artist'
      And header Authorization = token
      And header Content-Type = 'application/json'
      And request requestartist
      When method PUT
      When click("//span[@class='Type__TypeElement-goli3j-0 eHCcSU ellipsis-one-line']")
      And delay(2000)
      And click("//a[@href='/search']")
      And delay(2000)
      When click("//input[@class='Type__TypeElement-goli3j-0 ebHsEf QO9loc33XC50mMRUCIvf']")
      And delay(2000)
      And input("//input[@class='Type__TypeElement-goli3j-0 ebHsEf QO9loc33XC50mMRUCIvf']" , 'Camila Cabello')
      And delay(3000)
      When click("//button[@class='T0anrkk_QA4IAQL29get mYN_ST1TsDdC6q1k1_xs']")
      And delay(1000)
      And click("//div[@class='Type__TypeElement-goli3j-0 fQToy nk6UgB4GUYNoAcPtAQaG']")
      And delay(2000)
      And scroll("//div[@class='Type__TypeElement-goli3j-0 dhAODk' and text()='See more']")
      And delay(2000)
      And click("//button[@aria-label='Camila Cabello, Young Thug - Havana (feat. Young Thug) için diğer seçenekler']")
      And delay(2000)
      And click("//span[@class='Type__TypeElement-goli3j-0 ebHsEf ellipsis-one-line' and text()='Çalma listesine ekle']")
      And delay(2000)
      And click("//span[@class='Type__TypeElement-goli3j-0 ebHsEf ellipsis-one-line PDPsYDh4ntfQE3B4duUI' and text()='Mentorlabs Faz2']")
      And delay(2000)
      And click("//div[@class'hOWUEV7wHgfYPPLcnNXt']")
      And delay(2000)
      And click("//button[@data-testid='user-widget-dropdown-logout']]")
      Then delay(2000)




