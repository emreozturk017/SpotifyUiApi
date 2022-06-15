Feature: Api Test 

  Background:
    * def urlHome = 'https://open.spotify.com/'
    * def userid = '31pwtnpkdgtcxrud2smuljfb3qzi'
    * def token = 'Bearer BQAoAakC6yCMAxoWN_zv86v24G1swH4GlULBSaFSqq3DMMBGCpZRoq3EsZr_aPmsdOzCVM4ocT7i_nUzUZOT4tKUUWLfaYvF859E6bbtNL0hTahpZZdGubLed8-DbBn4A92LW2Uvl3rRkz7BR_otUN9TxuXUPkaEX4uHeeDTzvhadMSrQ-n36Kcvktp5zHL3ovwa834MkEtJHEXztEsemxUY-3qg2dJDBbT8oJUEH0J2UlcW00uUJRtqLCqqoUFqiVV8AS8LihBpq-M4CKg8lt646Q'
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


