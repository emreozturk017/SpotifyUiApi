Feature: Api Test 

  Background:
    * def urlHome = 'https://open.spotify.com/'
    * def userid = '31pwtnpkdgtcxrud2smuljfb3qzi'
    * def token = 'Bearer BQCSr_ndoCaXkU5v02WyCcf00aLba8m90ZX6sISuhNgxAXvO0uPNdXO5_DpzngncTQhitlbdlXjqYgwy7WU7W7pg7oS1etRlYNav7rtQJCPtBfexVcaHJMQxp_LWMfHSKRSGN4QlfMjXNIUegk7ICGg4ytLiN7AfmipEHw-VPNKd9GGud1RDVtP8jMX0zSGCGLKsrK8LiPoBGPagARv-cGj4dfdtf0Aop58oh0VNZoN505jdt9Ukg0gydzV3tvQKrBNricuu9hdnL2Z_OO_DOBV9UIqDAuFrWVcr3_rR2YSkT7Tl_oCXb0qTD6dosy_xq6OE'
    * def requestbody =
    """
  {
  "name": "ApiTestPlaylist",
  "description": "testSuccess",
  "public": false
  }
  """
    * def requestbody2 =
    """
    {
  "uris": [
    "spotify:track:3z8h0TU7ReDPLIbEnYhWZb"
  ],
  "position": 0
}
    """



  Scenario: get playlist
    
    Given url 'https://api.spotify.com/v1'
    And path '/me'
    And header Authorization = token

    When method GET

    @Ignore
    @Create
    Scenario: Create Playlist
      Given url 'https://api.spotify.com/v1'
      And path '/users/'+userid+'/playlists'
      And header Authorization = token
      And request requestbody
      When method POST
      And def playlistid = response.id

      @Search
      Scenario: Search item
        Given url 'https://api.spotify.com/v1'
        And path '/search'
        And header Authorization = token
        And header Content-Type = 'application/json'
        And param q = 'Bohemian Rhapsody'
        And param type = 'track'
        When method GET

        @Add
        Scenario: Add item
          * def callback = call read('KarateApi.feature@Create')
          * def playlistnewid = callback.playlistid
          Given url 'https://api.spotify.com/v1'
          And path '/playlists/'+playlistnewid+'/tracks'
          And header Authorization = token
          And header Content-Type = 'application/json'
          And request requestbody2
          When method POST


