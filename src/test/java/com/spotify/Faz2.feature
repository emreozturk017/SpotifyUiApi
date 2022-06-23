Feature: Faz2 Test

  Background:
    * configure driver = {type: 'chromedriver', executable:'src\\test\\resources\\chromedriver.exe'}
    * def urlHome = 'https://open.spotify.com/'
    * def userid = '31pwtnpkdgtcxrud2smuljfb3qzi'
    * def songid = '0nPb5PLTXAetNCpi0PyGGO'
    * def token = 'Bearer BQCSr_ndoCaXkU5v02WyCcf00aLba8m90ZX6sISuhNgxAXvO0uPNdXO5_DpzngncTQhitlbdlXjqYgwy7WU7W7pg7oS1etRlYNav7rtQJCPtBfexVcaHJMQxp_LWMfHSKRSGN4QlfMjXNIUegk7ICGg4ytLiN7AfmipEHw-VPNKd9GGud1RDVtP8jMX0zSGCGLKsrK8LiPoBGPagARv-cGj4dfdtf0Aop58oh0VNZoN505jdt9Ukg0gydzV3tvQKrBNricuu9hdnL2Z_OO_DOBV9UIqDAuFrWVcr3_rR2YSkT7Tl_oCXb0qTD6dosy_xq6OE'

    * def requestbody =
    """
  {
  "name": "Mentorlabs Faz2",
  "description": "testSuccess",
  "public": false
  }
  """

    * def requestbody2 =
    """
    {
  "uris": [
    "spotify:track:0nPb5PLTXAetNCpi0PyGGO"
  ],
  "position": 0
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
      And path '/users/'+userid+'/playlists'
      And header Authorization = token
      And request requestbody
      When method POST
      And def playlistid = response.id
      And url 'https://api.spotify.com/v1'
      And path '/playlists/'+playlistid+'/tracks'
      And header Authorization = token
      And header Content-Type = 'application/json'
      And request requestbody2
      When method POST
      And refresh()
      And delay(8000)
      And click("//div[@class='AINMAUImkAYJd4ertQxy']")
      And delay(2000)
      And click("//button[@class='Button-qlcn5g-0 iaAUvZ']")
      And delay(20000)
      And url 'https://api.spotify.com/v1'
      And path 'me/player/currently-playing'
      And header Authorization = token
      And method GET
      * def matchsong = karate.jsonPath(response,"$.['item'].['name']")
      And match matchsong == 'The Final Countdown'
      Then print 'Song Matched'

