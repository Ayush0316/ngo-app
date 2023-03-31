# <div align="center"> Google Solution Challenge 2023 - Creezy</div>

# Table of Contents
1. [ Problem Statement ](#problemstatement)
2. [ Solution ](#solution)
3. [ Sustainable Development Goals ](#goals)
4. [ How app deals with sustaianable goals? ](#deal)
5. [ SetUp on local env. ](#setup)
6. [ Directory Structure ](#structure)

<a name="problemstatement"></a>
# Problem Statement
Distributed data and information for the donators is a big problem. One who wants to contribute in NGOs in the form of wealth, food, cloth, shelter and many more needs to crawl over the entire web to find the best NGOs of their interest. No single site solution is available to them. 

Also sometimes, people voluntary want to contribute for some good cause by forming community among some stranger people with same interest, but no app or website deals with this problem.

According to the <a href="https://www.unv.org/power-volunteerism">UN Volunteers</a> more than 1 billion people voluntary contribute to society, majorly serving in thier own countries. We can expect there is huge capability in volunteerism which is not exploited yet because of lack of any medium to join people together.

<b>Hence we come up with the solution for these problems.</b>

<br>

<a name="solution"></a>
# Solution
Our app deals with both these problems together and provide the users interface, where all the NGOs are listed. User can choose the NGO of his/her interest and contribute further. In same way the voluntary communities opened at this time are visible to them on the interface where all the regarding information is provided. User can then choose among them to volunteer. 

<br>

<a name="goals"></a>
# Sustainable Development Goals
Our app takes account 2 UNs Sustainable Development goals:-
<ul>
<li>Partnerships for goals</li>
<li>Peace, justice and strong institutions</li>
</ul>

<br>

<a name="deal"></a>
# How our app deals with these Sustainable goals?
As a teenager and social problems conscious, we always keep looking for a single site where all the details related to NGOs will be found, so it will be easy for us to contribute and donate. With the help of this we make partnerships among the donators and NGOs.

<b><u> We know many sites already of such type exist, but what's different in ours? </u></b>

Our app has an additional feature of community build-up. Many students, and teenagers are constantly looking for opportunities where they can volunteer part-time for some good cause. So our app is solving this problem by bringing people from all over the world to single app and form community according to their interests.

<br>

<a name="setup"></a>
# SetUp on local env.
1. Fork the repo and clone all the files.
2. Now open a terminal ,run the follwing commands and close this terminal.

    ```
    $ cd JSON-Transformation
    ```
    ``` 
    $ cd app
    ```
    ```
    $ npm
     ```
    ```
    $ cd..
    ```
    ``` 
    $ cd app_ui
    ```
    ```
    $ npm i
    ```
3. Now open 2 diffrent terminals simultaneously.
4. In First terminal, run the follwing commands.
    ```
    cd app
    node server.js
    ```
5. In Second terminal, run the follwing commands.
    ```
    cd app_ui
    npm start
    ```
6. Now open your browser and visit localhost:3000

<br>

<b>All done, now you should be able to see the webpage of our website.</b>

<br>

<a name="structure"></a>
# Directory Structure
```
ngo-app
|--- ngo_app
|    |--- assets               # All assets of app like recommendation models
|    |--- images               # All images used in app(static files) 
|    |--- public
|    |    |--- index.html
|    |--- pubspec.yaml          # yaml file for the app
```
