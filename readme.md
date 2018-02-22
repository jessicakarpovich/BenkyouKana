# Introduction #

BenkyouKana is an app, written in Swift, for studying Japanese. For the time being it is iOS only.

# Current Functionality #

Right now there is only one option on start, Review. If the user selects it, he is directed to Review Options. There the user can select Hiragana or Katakana, the amount of exercises, and the kana set. The default options are Hiragana and the A-N set. Until the user enters a vaild Int for the number of exercises, the Done button is disabled. 

If the user selects Katakana, the border around Hiragana will disappear and a border will appear around Katakana to show that it has been selected. The kana sets are listed identically for Hiragana and Katakana and are selected using a picker control.

Once all input is valid and the user presses Done, the user is presented with a random Hiragana or Katakana (based on what button was selected). There is a text field below for entering the romaji equivalent. If the user input is correct, another random kana is presented. If the user is wrong, a red X is displayed with the correct romaji below. The user can then try again. 

As the user continues, correct input is tracked and once the number of exercises the user selected is completed, the amount the user got right out of the total is presented as a fraction. By pressing Done, the user returns to the Review Options.
