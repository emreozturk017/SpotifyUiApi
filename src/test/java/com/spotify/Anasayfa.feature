Feature: Anasayfa login işlemi

  Background:
    * configure driver = {type: 'chromedriver', executable:'src\\test\\resources\\chromedriver.exe'}


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
    When click("//div[@class='q3ABXYJT9JZIzXOOtVuO']")
    And delay(2000)
    And click("//span[@class='o4KVKZmeHsoRZ2Ltl078']")
    And delay(2000)
    And click("//input[@class='f0GjZQZc4c_bKpqdyKbq JaGLdeBa2UaUMBT44vqI']")
    And input("//input[@class='f0GjZQZc4c_bKpqdyKbq JaGLdeBa2UaUMBT44vqI']", 'Mentorlabs Challange')
    And delay(3000)
    And click("//button[@class='Button-qlcn5g-0 jvEinx']")
    And delay(2000)
    When click("//span[@class='Type__TypeElement-goli3j-0 eHCcSU ellipsis-one-line']")
    And delay(2000)
    And click("//a[@href='/search']")
    And delay(2000)
    When click("//input[@class='Type__TypeElement-goli3j-0 ebHsEf QO9loc33XC50mMRUCIvf']")
    And delay(2000)
    And input("//input[@class='Type__TypeElement-goli3j-0 ebHsEf QO9loc33XC50mMRUCIvf']" , 'Daft Punk')
    And delay(3000)
    When click("//button[@class='T0anrkk_QA4IAQL29get mYN_ST1TsDdC6q1k1_xs']")
    And delay(1000)
    And click("//span[@class='Type__TypeElement-goli3j-0 ebHsEf ellipsis-one-line']and text'Çalma listesine ekle'")
    And delay(1000)




