# The Gilded0ne Repo >.<

### start up guide

first clone the repo with

`git clone https://github.com/Tempest7274/TheGildedOne`

then go inside the folder

`cd TheGildedOne/n8n-workstuff`

and run 

`mv .env-example .env`

you can edit the .env parameters and use the credentials you wish.

Then lastly, simply run 

`sudo docker compose up -d`

and that will start the containers. 

To use n8n, you need to run

`sudo docker logs n8n-tunnel-1`
copy the url displayed, paste it into your browser, and that will send you to n8n.

for wordpress its just

`yourip:8080` 
and for moodle its 8081 instead of 8080.
