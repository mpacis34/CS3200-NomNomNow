# MySQL + Flask Boilerplate Project

This repo contains a boilerplate setup for spinning up 2 docker containers: 
1. A MySQL 8 container for obvious reasons
1. A Python Flask container to implement a REST API

## How to setup and start the containers
**Important** - you need Docker Desktop installed

1. Clone this repository.  
1. Create a file named `db_root_password.txt` in the `secrets/` folder and put inside of it the root password for MySQL. 
1. Create a file named `db_password.txt` in the `secrets/` folder and put inside of it the password you want to use for the `webapp` user. 
1. In a terminal or command prompt, navigate to the folder with the `docker-compose.yml` file.  
1. Build the images with `docker compose build`
1. Start the containers with `docker compose up`.  To run in detached mode, run `docker compose up -d`. 

## For setting up a Conda Web-Dev environment:

1. `conda create -n webdev python=3.9`
1. `conda activate webdev`
1. `pip install flask flask-mysql flask-restful cryptography flask-login`

## Project Synopsis

NomNomNow is an mvp application that allows struggling family-owned restaurants that are not up-to-date with the latest technology amidst the COVID-19 pandemic to reach more customers. Since many customers are now choosing to get to-go and are not comfortable dining inside the restaurants, this app will help customers discover small, local, family-owned restaurants to support and get their food from. The application includes a delivery service where customers can send in food orders that are picked up by drivers and delivered to the customers’ addresses. The three main user personas for the NomNomNow app are customers, restaurant owners, and delivery drivers. 

## Tech Stack Used
The application uses the following technologies, languages, and tools:
1. Python
2. Flask
1. REST API
1. Docker (required to have installed to run the application)
1. Appsmith
1. MySQL
1. Mockaroo

## Important to Know
The application uses mock data generated by Mockaroo.

## How to Set Up the Application
1. Clone this repository.  
1. Create a file named `db_root_password.txt` in the `secrets/` folder and put inside of it the root password for MySQL. 
1. Create a file named `db_password.txt` in the `secrets/` folder and put inside of it the password you want to use for the `webapp` user. 
1. In a terminal or command prompt, navigate to the folder with the `docker-compose.yml` file.  
1. Build the images with `docker compose build`
1. Start the containers with `docker compose up`.  To run in detached mode, run `docker compose up -d`. 
1. Once the docker containers have been built and initialized, input the following url into a browser: http://127.0.0.1:8001
1. In a command prompt, access the file location where ngrok is located, and type the following in the command prompt: ngrok http 8001
1. Copy the forwarding url from the ngrok command prompt
1. Open up the project on the Appsmith server
1. In the datasource section of the Appsmith application, update the url of the authenticated API with the copied ngrok url
1. Afterwards, select the "Deploy" button to start the application.


## How to Use the Application in Appsmith
1. Press the "Deploy" button to start the application
1. The home screen should be the menu that displays a table with all available restaurants with relevant information. This table is what a customer using the application sees when browsing restaurants that are under the service.
1. Select a restaurant in the table to access the menu of the corresponding restaurant in a separate screen. Once the menu is accessed, a customer can see all available menu items that a restaurant serves and can see the relevant information for it.
1. To add a menu item as a restaurant persona, select the corresponding page labeled "Add Menu Item".
1. Once in the page, fill in the corresponding areas to add a menu item to the corresponding menu of a restaurant via the menu id, which is the same as a restaurant's id.
1. Click submit when finished. The input will be added to the database in the MenuItem table.
1. As a restaurant persona, to view all of its orders, select the "Get Restaurant Order" page.
1. Click on a restaurant in the displayed table to be redirected to a page that contains information for all orders made by customers for the restaurant.
1. To view all customers using the application, which is what an administrator would do, select the "Get all customers" page to access all information on every customer that has joined Nomnomnow.


## How to use the Application via Browser
The application features, some of which were not implemented in Appsmith. All of the POST request routes are supported in Appsmith and do not work by entering the URL in the browser. All GET requests properly function in the browser by entering the URL.



## Credits
The following application was created by Micah Pacis, Andrew Tsai, and Tri Watanasuparp as a final project for CS3200 under the instruction of Mark Fontenot at Northeastern University.





