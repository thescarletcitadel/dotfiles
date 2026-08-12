using i3 and arch for a tv box can work pretty well if i make use of zen browser being able to be configured to open as a seperate app and look basically like an app depending on the web application, the sh file in this directory is the same for any web app using the zen appimage.




i3 config for the app grid menu make sure to use the appgrid config for rofi when you do this otherwise it might mess up


bindsym Menu exec rofi -config ~/.config/rofi/app-grid.rasi -show drun

for_window [title="netflix"] fullscreen enable
assign [class="netflix"] $ws2



for every web app you need a .desktop file that points to the script for opening the webapp and then the downloaded icon for the app menu, 
